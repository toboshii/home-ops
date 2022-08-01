#!/usr/bin/env bash

location="/media/Incoming/{Usenet|Torrents}/Series"

find $location -type f \( -iname "*op[0-9]*" -o -iname "*nced*" -o -iname "*ncop*" -o -iname "*music video*" \) -exec rm -rf {} \;

