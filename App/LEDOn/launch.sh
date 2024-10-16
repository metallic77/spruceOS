#!/bin/sh
for i in $(seq 1 3); do 
    echo 1 > /sys/devices/platform/sunxi-led/leds/led1/brightness
    sleep 0.3
    echo 0 > /sys/devices/platform/sunxi-led/leds/led1/brightness
    sleep 0.3
done

if [ -f /mnt/SDCARD/.tmp_update/flags/ledon.lock ]; then
    sed -i 's/LED - On/LED - Off/' /mnt/SDCARD/App/LEDOn/config.json
    rm /mnt/SDCARD/.tmp_update/flags/ledon.lock
elif [ -f /mnt/SDCARD/.tmp_update/flags/tlon.lock ]; then
    sed -i 's/LED - On In Menu Only/LED - On/' /mnt/SDCARD/App/LEDOn/config.json
    rm -f /mnt/SDCARD/.tmp_update/flags/tlon.lock
    touch /mnt/SDCARD/.tmp_update/flags/ledon.lock
else
    sed -i 's/LED - Off/LED - On In Menu Only/' /mnt/SDCARD/App/LEDOn/config.json
    touch /mnt/SDCARD/.tmp_update/flags/tlon.lock
    rm /mnt/SDCARD/.tmp_update/flags/ledon.lock
fi
