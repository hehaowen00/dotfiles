#!/bin/bash
sudo modprobe -r wacom && sudo modprobe -v usbhid quirks="0x0930:0x0807:0x0040"
