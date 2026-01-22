#!/bin/sh

if bluetoothctl show | grep -q "Powered: yes"; then
    bluetoothctl power off
    notify-send -u low -i bluetooth-disabled "Bluetooth" "has been turned off"
else
    bluetoothctl power on
    notify-send -u low -i bluetooth-active "Bluetooth" "has been turned on"
fi

pkill -SIGRTMIN+1 i3status-rs
