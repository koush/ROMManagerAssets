#!/sbin/sh
cp /cache/e2fsck /sbin/e2fsck
cp /cache/parted /sbin/parted
cp /cache/sdparted /sbin/sdparted
rm /sbin/tune2fs
cp /cache/tune2fs /sbin/tune2fs
rm -rf /cache/rommanager
sdparted -es $1 -ss $2 -efs ext3 -s
RESULT=`echo $?`
if [ "$RESULT" != 0 ]; then
    return 1
fi
return 0
