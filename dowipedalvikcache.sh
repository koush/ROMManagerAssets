#!/sbin/sh
for partition in data cache system sd-ext
do
    mount /$partition
    rm -rf /$partition/dalvik-cache
done
