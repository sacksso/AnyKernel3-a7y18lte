### AnyKernel3 Ramdisk Mod Script
## armado para Samsung Galaxy A7 2018 (a7y18lte, exynos7885) - LineageOS 18.1

### AnyKernel setup
properties() { '
kernel.string=a7y18lte custom kernel (GCC 6.4.1, lineage-18.1)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=a7y18lte
device.name2=SM-A750F
device.name3=SM-A750FN
device.name4=SM-A750G
device.name5=
'; } # end properties

### AnyKernel install
BLOCK=/dev/block/by-name/BOOT;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

. tools/ak3-core.sh;

dump_boot;
write_boot;
## end install
