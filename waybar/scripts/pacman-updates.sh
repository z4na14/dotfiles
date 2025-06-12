# Author: autom4il
# Date: 10 Feb 24
# Desc: Check pacman updates

if /usr/bin/ip link show enp0s20f0u4c2 |grep -q "state UP"
then
    check_updates=$(checkupdates |wc -l)
else
    check_updates="?"
fi

echo "$check_updates"
