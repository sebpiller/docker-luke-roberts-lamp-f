#!/bin/bash

#service dbus start
#bluetoothd &

/etc/init.d/dbus start

/usr/lib/bluetooth/bluetoothd --debug &


/bin/bash