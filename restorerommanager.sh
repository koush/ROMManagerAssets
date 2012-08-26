#!/sbin/sh
echo foo > /sdcard/testthingy
if [ ! -f /system/app/RomManager.apk ]
then
	cp /tmp/recovery/RomManager.apk /system/app/RomManager.apk
fi
