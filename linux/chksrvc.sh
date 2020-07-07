#!/bin/bash

service=$#

for service; do

if (systemctl -q is-active $service)
        then
                echo "$service is running!"
        else
                echo "$service is NOT running!"
                echo "Ok, let's do somethin."
                echo "Try to start $service."
                /usr/sbin/service $service start
                echo "Supposely started. Let's re-check."
                if (systemctl -q is-active $service)
                then
                        echo "All right, $service is now running!"
                else
                        echo "Oh no!! NO!!! Somethin wrong somewhere."
                fi
        fi
done
