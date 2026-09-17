#!/sbin/sh
## AnyKernel3 setup script
# osm0sis @ xda-developers

# Set properties
properties() { '
kernel.string=Kernel for Samsung Galaxy A7 2018 (a7y18lte) - Base (Permissive SELinux)
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
BLOCK=/dev/block/platform/13500000.dwmmc0/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;

# Import the core script
. tools/ak3-core.sh;

# Custom modifications (if any)
# You can add your own tweaks here

# Flash the boot image
dump_boot;

# --- OC CPU opt-in, SOLO PARA TESTEO (ver exynos-acme.c) ---
# cpu_max_c1 = LITTLE (domain@0, sibling-cpus 0-5) -> probando el techo
#   documentado por el kernel origen, sin precedente mayor conocido.
# cpu_max_c2 (BIG, domain@1) NO se pasa a propósito: ya se confirmó en
#   este mismo dispositivo que ir más allá del stock (2184000) en BIG
#   causa fallos (intento previo a 2288000). Sin este parámetro, BIG
#   queda en su máximo de stock, sin overclock.
# Se usa patch_cmdline, la función real de ak3-core.sh para esto: agrega
# la entrada si no existe, o reemplaza su valor si ya está (permite
# reflashear cambiando el valor sin duplicar entradas). Para volver a
# stock puro: borrar esta línea y reflashear (o pasar cpu_max_c1=0, que
# por diseño del parser en exynos-acme.c es no-op).
patch_cmdline "cpu_max_c1" "cpu_max_c1=1690000";

write_boot;
