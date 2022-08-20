#!/sbin/sh

mkdir -p /lta-label
mount -o ro /dev/block/platform/msm_sdcc.1/by-name/LTALabel /lta-label
ls lta-label/*.html | grep -q c6[89]02
if [ $? -eq 0 ]; then
	cp /system/etc/firmware/c6x02/* /system/etc/firmware/
fi
umount /lta-label
