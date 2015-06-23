#!/bin/sh -vxe
# install.robot.sh: install the script that runs after boot.
# usage: sudo ./install.robot.sh

[ "$USER" = "root" ]

dir=`dirname $0`

cp "$dir/robot.sh" /etc/init.d/
cd /etc/init.d/
chmod +x robot.sh
update-rc.d robot.sh defaults
