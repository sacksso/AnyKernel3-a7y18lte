#!/sbin/sh
### AnyKernel3 Ramdisk Mod Script
## armado para Samsung Galaxy A7 2018 (a7y18lte, exynos7885) - LineageOS 18.1
## kernel compilado desde exynos7885-dev/kernel_samsung_exynos7885 (lineage-18.1)
## con GCC 6.4.1 + los 3 fixes de código verificados (decon_reg.c, topology.c,
## nl80211_vendor.c) - sin ningun KCFLAGS de supresion de warnings.

### AnyKernel setup
# global properties
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
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install
# boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

# boot shell variables
# BLOCK confirmado en el dispositivo real via:
#   ls -la /dev/block/by-name/ | grep -i boot
#   -> BOOT -> /dev/block/mmcblk0p11
BLOCK=/dev/block/by-name/BOOT;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
dump_boot;

# No se modifica nada del ramdisk (init.rc, fstab, etc) - este paquete
# SOLO reemplaza el kernel Image dentro de boot. El ramdisk, dtb, y
# todo lo demas dentro de la particion BOOT actual se conserva tal
# cual, incluida la configuracion de Magisk si ya estaba instalado
# (dump_boot/write_boot de AnyKernel3 re-parchea Magisk automaticamente
# si lo detecta).

write_boot;
## end boot install
