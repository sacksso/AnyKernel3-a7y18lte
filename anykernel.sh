#!/sbin/sh
#
# AnyKernel3 script - a7y18lte
#
# This is a standard template. Adjust as needed.

# Set up variables
kernel=Image
device.name1=a7y18lte
device.name2=SM-A750F
device.name3=SM-A750FN
device.name4=SM-A750G
device.name5=
device.name6=

# Set up paths
block=/dev/block/platform/13500000.dwmmc0/by-name/BOOT
is_slot_device=0
ramdisk_compression=auto

# Set up functions
. /tmp/anykernel/tools/ak3-core.sh

# Dump current boot image for modification
dump_boot;

# Write the kernel (Image) to the boot image
write_boot;

# Done
reset_ak;
