#!/usr/bin/env zx

// Usage:
// ctl.mjs snapshot list --app whisparr --namespace default
// ctl.mjs talos prepare --user --pass --nodes k8s-control01 --reset
// ctl.mjs talos install --nodes k8s-control01 --bootstrap-node k8s-control01
// ctl.mjs talos upgrade --nodes k8s-control01,k8s-control02,k8s-control03
import { Snapshot } from './lib/Snapshot.class.mjs';
import { Talos } from './lib/Talos.class.mjs';

$.verbose = false

const COMMAND = argv["_"][0]
const ARG     = argv["_"][1]
const DEBUG   = argv["debug"] || false
const HELP    = argv["help"]  || false

if (DEBUG) { $.verbose = true }
switch(COMMAND) {
    case "snapshot":
        const snapshot = new Snapshot(DEBUG, HELP)
        switch(ARG) {
            case "list":
                await snapshot.List()
                break;
            case "create":
                await snapshot.Create()
                break;
            default:
                console.log(`404: ${ARG} arg not found`)
        }
        break;
    case "talos":
        const talos = new Talos(DEBUG, HELP)
        switch(ARG) {
            case "prepare":
                await talos.Prepare()
                break;
            default:
                console.log(`404: ${ARG} arg not found`)
        }
        break;
    default:
        console.log(`404: ${COMMAND} command not found`)
}
