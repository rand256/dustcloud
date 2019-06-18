#!/bin/bash

dpkg -i /root/fuse/libfuse.deb
dpkg -i /root/fuse/fuse.deb

echo "user_allow_other" >> /etc/fuse.conf
chmod +r /etc/fuse.conf

sed -i 's/^exit 0//' /etc/rc.local
if [ -d /mnt/data/rockrobo/sounds_multi ]; then
	su ruby -c "bbfs -o nonempty,allow_root /mnt/data/rockrobo/sounds_multi /mnt/data/rockrobo/sounds"
else
	echo -n "#" >> /etc/rc.local
fi
echo "su ruby -c \"bbfs -o nonempty,allow_root /mnt/data/rockrobo/sounds_multi /mnt/data/rockrobo/sounds\"" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

sed -i 's/\/root\/fuse\/install.sh//' /etc/rc.local
