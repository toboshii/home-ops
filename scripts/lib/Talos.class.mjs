import { retry, expBackoff } from 'zx/experimental'

class Talos {

    constructor(debug = false, help = false) {
        this.debug        = debug
        this.help         = help
        this.kvm          = argv["kvm"] || argv["k"] || process.env.KVM_HOST
        this.kvmUsername  = argv["username"] || argv["u"] || process.env.KVM_USERNAME
        this.kvmPassword  = argv["password"] || argv["p"] || process.env.KVM_PASSWORD
        this.nodes        = argv["nodes"] || argv["n"] || process.env.TALOS_NODES
        this.reset        = argv["reset"] || argv["r"] || process.env.TALOS_RESET
        this.image        = argv["image"] || argv["m"] || process.env.TALOS_IMAGE
        this.insecure     = argv["insecure"] || argv["i"] || process.env.INSECURE
        this.nodes        = this.nodes.split(',')
        this.proto        = this.insecure ? 'http' : 'https'

        if (this.debug) {
            $.verbose = true
        }
    }

    async Prepare() {
        if (this.help) {
            console.log(`Usage: ctl talos prepare --kvm <piKVM hostname/IP>
                         --username <piKVM user>
                         --password <piKVM password>
                         --nodes <comma-delimited list of Talos node hostnames>
                         [ --image <url to Talos ISO> ]
                         [ --reset ]
                         [ --insecure ]`)
            process.exit(0);
        }
        if (!this.kvm)           { throw new Error("Argument --kvm, -k or env KVM_HOST not set") }
        if (!this.kvmUsername)   { throw new Error("Argument --username, -u or env KVM_USERNAME not set") }
        if (!this.kvmPassword)   { throw new Error("Argument --password, -p or env KVM_PASSWORD not set") }
        if (!this.nodes)         { throw new Error("Argument --nodes, -n or env TALOS_NODES not set") }
        if (!this.image)         { this.image = `https://github.com/siderolabs/talos/releases/latest/download/talos-amd64.iso` }

        const crypto = require('crypto')
        const hash = crypto.randomBytes(4).toString('hex')
        const imageName = `talos-${hash}.iso`

        let headers = { "X-KVMD-User": this.kvmUsername, "X-KVMD-Passwd": this.kvmPassword }

        const talConfig = YAML.parse(fs.readFileSync('../talos/talconfig.yaml', 'utf8'))

        console.log(`Attaching ${this.image} to piKVM virtual CD-ROM`)

        // ensure drive is detached to prevent `MsdConnectedError`
        await this.attachDrive(headers, false)

        await this.uploadImage(headers, imageName)
        await this.selectImage(headers, imageName)
        await this.attachDrive(headers, true)

        for (let node of this.nodes) {
            console.log(`Preparing node ${node}`)
            let nodeConfig = talConfig.nodes.find((n) => {
                return (n.hostname.split('.')[0] === node)
            })

            console.log(`Switching to KVM channel ${nodeConfig.kvmChannel}`)
            await this.setChannel(headers, nodeConfig.kvmChannel)

            console.log(`Waiting for KVM devices to settle`)
            await sleep(5000)

            console.log(`Rebooting machine into Talos installer`)
            // // @TODO: add support for running `talosctl reset` and ceph wipe if(--reset)
            // // @TODO: add dry-run support - comment out for now
            // //await this.sendReboot(headers)

            console.log(`Waiting for Talos apid to be available`)
            await sleep(30000)
            let healthCheck = await retry(30, expBackoff(), () => $`nc -z ${nodeConfig.ipAddress} 50000`)
            if (await healthCheck.exitCode === 0) {
                console.log(`${chalk.green.bold('Success:')} You can now push a machine config to ${this.nodes}`)
            }
        }

        console.log(`Disconnecting virtual CD-ROM from piKVM and cleaning up`)
        await this.attachDrive(headers, false)
        await this.deleteImage(headers, imageName)
    }

    // Set TESMART switch channel
    async setChannel(headers, channel) {
        const response = await fetch(`${this.proto}://${this.kvm}/api/gpio/pulse?channel=server${--channel}_switch`, { method: 'POST', headers })
        if (!response.ok) {
            const json = await response.json()
            throw new Error(`${json.result.error} - ${json.result.error_msg}`)
        }
        return await response.json()
    }

    // Upload provided or latest image to piKVM
    async uploadImage(headers, imageName) {
        const response = await fetch(`${this.proto}://${this.kvm}/api/msd/write_remote?url=${this.image}&image=${imageName}&timeout=60`, { method: 'POST', headers })
        if (!response.ok) {
            const json = await response.json()
            throw new Error(`${json.result.error} - ${json.result.error_msg}`)
        }
        return await response.text()
    }

    // Select active ISO image for piKVM virtual CD-ROM
    async selectImage(headers, imageName) {
        const response = await fetch(`${this.proto}://${this.kvm}/api/msd/set_params?image=${imageName}&cdrom=1`, { method: 'POST', headers })
        if (!response.ok) {
            const json = await response.json()
            throw new Error(`${json.result.error} - ${json.result.error_msg}`)
        }
        return await response.json()
    }

    // Delete ISO image from piKVM
    async deleteImage(headers, imageName) {
        const response = await fetch(`${this.proto}://${this.kvm}/api/msd/remove?image=${imageName}`, { method: 'POST', headers })
        if (!response.ok) {
            const json = await response.json()
            throw new Error(`${json.result.error} - ${json.result.error_msg}`)
        }
        return await response.json()
    }

    // Attach piKVM virtual CD-ROM to server
    async attachDrive(headers, attach) {
        const response = await fetch(`${this.proto}://${this.kvm}/api/msd/set_connected?connected=${attach ? 1 : 0}`, { method: 'POST', headers })
        if (!response.ok) {
            const json = await response.json()
            if (json.result.error == 'MsdDisconnectedError' && attach === false) {
                // Ignore errors caused by detaching a detached drive
                return json
            }
            throw new Error(`${json.result.error} - ${json.result.error_msg}`)
        }
        return await response.json()
    }

    // Send CTRL-ALT-DEL to piKVM
    async sendReboot(headers) {
        // await Promise.all([
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=ControlLeft&state=true`, { method: 'POST', headers })
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=AltLeft&state=true`, { method: 'POST', headers })
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=Delete&state=true`, { method: 'POST', headers })
        // ])

        await sleep(2000)

        // await Promise.all([
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=ControlLeft&state=false`, { method: 'POST', headers })
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=AltLeft&state=false`, { method: 'POST', headers })
        await fetch(`${this.proto}://${this.kvm}/api/hid/events/send_key?key=Delete&state=false`, { method: 'POST', headers })
        // ])
    }

}

export { Talos }
