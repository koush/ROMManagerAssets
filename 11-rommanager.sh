#!/sbin/sh
case "$1" in
  backup)
    mount /data
    DATA_APK=$(ls /data/app/com.koushikdutta.rommanager-*.apk)
    if [ -f "$DATA_APK" ]
    then
      cp "$DATA_APK" /tmp/RomManager.apk
    elif [ -f /system/app/RomManager.apk ]
    then
      cp /system/app/RomManager.apk /tmp/RomManager.apk
    fi
  ;;
  restore)
    if [ -f /tmp/RomManager.apk ]
    then
      cp /tmp/RomManager.apk /system/app
    fi
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
  place)
    mount /system
    if [ -d /system/addon.d ]
    then
      cp $0 /system/addon.d
    fi
  ;;
esac