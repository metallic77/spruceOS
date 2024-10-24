#!/bin/sh

EMU_DIR="$(dirname "$0")"
CONFIG="$EMU_DIR/config.json"
SYS_OPT="$EMU_DIR/system.opt"

update_core_config_name() {
    if [ -f "$CONFIG" ]; then
        sed -i 's|"name": "✓ Core is fbneo"|"name": "Change core to fbneo"|g' "$CONFIG"
        sed -i 's|"name": "✓ Core is mame2003_plus"|"name": "Change core to mame2003_plus"|g' "$CONFIG"
        sed -i 's|"name": "✓ Core is fbalpha2012"|"name": "Change core to fbalpha2012"|g' "$CONFIG"
        sed -i 's|"name": "✓ Core is km_mame2003_xtreme"|"name": "Change core to km_mame2003_xtreme"|g' "$CONFIG"
        sed -i 's|"name": "Change core to mame2003_plus"|"name": "✓ Core is mame2003_plus"|g' "$CONFIG"
    fi
}

update_core_config_name

sed -i 's/CORE=.*/CORE=\"mame2003_plus\"/g' "$SYS_OPT"