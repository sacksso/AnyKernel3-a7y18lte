#!/sbin/sh
## AnyKernel3 setup script
# osm0sis @ xda-developers

# Set properties
properties() { '
kernel.string=Kernel for Samsung Galaxy A7 2018 (a7y18lte) - Clean SELinux
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=a7y18lte
device.name2=SM-A750F
device.name3=SM-A750FN
device.name4=SM-A750G
device.name5=
supported.versions=
supported.patchlevels=
'; }

# Set shell variables
block=/dev/block/platform/13500000.dwmmc0/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;

# Import the core script
. tools/ak3-core.sh;

# Custom modifications (if any)
# You can add your own tweaks here

# Flash the boot image
dump_boot;
write_boot;
