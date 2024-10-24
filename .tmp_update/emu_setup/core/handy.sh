#!/bin/sh

EMU_DIR="$(dirname "$0")"
CONFIG="$EMU_DIR/config.json"
SYS_OPT="$EMU_DIR/system.opt"

update_core_config_name() {
    if [ -f "$CONFIG" ]; then
        sed -i 's|"name": "✓ Core is mednafen_lynx"|"name": "Change core to mednafen_lynx"|g' "$CONFIG"
        sed -i 's|"name": "✓ Core is handy"|"name": "Change core to handy"|g' "$CONFIG"
        sed -i 's|"name": "Change core to handy"|"name": "✓ Core is handy"|g' "$CONFIG"
    fi
}

update_core_config_name

sed -i 's/CORE=.*/CORE=\"handy\"/g' "$SYS_OPT"