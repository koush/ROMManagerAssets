#!/sbin/sh
rm -rf /sdcard/clockworkmod/blobs
mkdir -p /sdcard/clockworkmod/blobs

cp /cache/dedupe /sbin/dedupe
for partition in data system
do
    mount -t auto /$partition
done

CLOUD_FOLDER="/sdcard/clockworkmod/cloud"
mkdir -p "$CLOUD_FOLDER"
for folder in /data /system /sdcard/.android_secure
do
    FOLDER_NAME=$(basename $folder)
    dedupe c $folder /sdcard/clockworkmod/blobs "$CLOUD_FOLDER/$FOLDER_NAME.dup"
done

if [ -f $1/boot.img ]
then
    rm -rf /tmp/boot
    mkdir -p /tmp/boot
    cp $1/boot.img /tmp/boot
    dedupe c /tmp/boot /sdcard/clockworkmod/blobs "$CLOUD_FOLDER/boot.dup"
fi
