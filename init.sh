#!/bin/bash

# For zram
modprobe zram
zramctl -f --size 1024M
mkswap /dev/zram0
swapon -p 100 /dev/zram0

# For acpi interrupts
echo disable > /sys/firmware/acpi/interrupts/gpe11
# For intel_powerclamp
rmmod intel_powerclamp

# For test
touch /root/touch_test
