#!/bin/bash

binary=/etc/acpi/acdcontrol
device=$($binary --silent --detect /dev/usb/* | cut -d ':' -f 1)
inc=50

if [ "$1" = "up" ]; then
	$binary --silent --brief "$device" -- +$inc
elif [ "$1" = "down" ]; then
	$binary --silent --brief "$device" -- -$inc
else
	echo >&2 'unknown arg'
	exit 1
fi
