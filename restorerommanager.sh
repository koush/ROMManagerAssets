#!/sbin/sh
if [ ! -f /system/app/RomManager.apk ]
then
	cp /tmp/recovery/RomManager.apk /system/app/RomManager.apk
fi
