#!/bin/bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
          ;&
        reboot)
          ;&
        suspend)
          systemctl $op
          ;;
        logout)
          exit
          ;;
esac
