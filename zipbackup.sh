cd $1
cd ..
BACKUPNAME=$2
function listfiles {
  busybox ls -1 backup/$BACKUPNAME/* 
  cat backup/$BACKUPNAME/*.dup  | busybox grep ^f$'\t' | busybox cut -f 9 | busybox sed s/^/blobs\\//
}

busybox tar cf - $(listfiles)
exit $?