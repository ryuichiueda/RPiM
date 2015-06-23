#!/bin/sh -vxe
# uninstall.robot.sh: uninstall the script that runs after boot.
# usage: sudo ./uninstall.robot.sh

[ "$USER" = "root" ]

cd /etc/init.d/
update-rc.d robot.sh remove
rm /etc/init.d/robot.sh
