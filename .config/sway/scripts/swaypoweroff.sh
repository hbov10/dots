#!/usr/bin/env bash

op=$( echo -e "󰐥 Poweroff\n󰜉 Reboot\n󰤄 Suspend\n󰌾 Lock\n󰗽 Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
		systemctl poweroff -i
		;;
        reboot)
		systemctl reboot -i
		;;
        suspend)
                systemctl suspend -i
                ;;
        lock)
		swaylock -f #$(find /home/hbov/Pictures/Rollei_400s/. -type f | shuf -n1)
                ;;
        logout)
                swaymsg exit
                ;;
esac
