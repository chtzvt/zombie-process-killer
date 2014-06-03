#!/bin/bash

#Zombie destroyer v1.3 "Belmont"
#By Charlton Trezevant

#Check if the user is worthy to wield
#the mighty sword of /bin/kill, of the land of procps.

if [ "$(id -u)" != "0" ]; then
   echo "Only root may exorcise the undead from this system." 1>&2
   exit 1
fi

echo ' '
echo What a horrible night to have a curse...
echo ' '

#Free the restless undead and restore peace (and memory space) to the system.
kill -HUP `ps -A -ostat,ppid | grep -e '^[Zz]' | awk '{print $2}'` >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo The powerful root user has vanquished the terrible plauge of the undead.
else
    echo The power of evil has overcome even the forces of root.
    echo It is possible that there were no zombies to destroy in the first place.
    echo Only a reboot may save you now...
fi

exit

