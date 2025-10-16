#!/usr/bin/env bash
set -euo pipefail

# Change to the directory containing this script
cd "$(dirname "$0")"

nix run .#nixosConfigurations.workstation.config.system.build.vm
rm ./nixos.qcow2