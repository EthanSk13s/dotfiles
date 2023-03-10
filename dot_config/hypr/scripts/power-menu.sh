#!/bin/bash

op=$( echo -e "ī Poweroff\nī Reboot\nī Suspend\nī Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

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
