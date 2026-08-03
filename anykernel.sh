#!/bin/bash

## AnyKernel3
## Samsung Galaxy A7 2018
## a7y18lte

properties() {
kernel.string=Samsung Galaxy A7 2018 OC Kernel
do.devicecheck=1
device.name1=a7y18lte
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
}

block=/dev/block/by-name/BOOT;

is_slot_device=0;

ramdisk_compression=auto;

patch_vbmeta_flag=0;


. tools/ak3-core.sh;


split_boot;


flash_boot;


ui_print "=============================="
ui_print " Samsung Galaxy A7 2018"
ui_print " a7y18lte OC Kernel"
ui_print ""
ui_print " CPU:"
ui_print " A73 2288 MHz"
ui_print " A53 1690 MHz"
ui_print ""
ui_print " GPU:"
ui_print " Mali-G71 MP2 1300 MHz"
ui_print "=============================="
