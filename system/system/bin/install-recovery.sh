#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:290ed97344b93de50540e8d9d98b2c27c832ad0b; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:f1af7acea08065b2b5bcb093a67a029afa70970b \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:290ed97344b93de50540e8d9d98b2c27c832ad0b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
