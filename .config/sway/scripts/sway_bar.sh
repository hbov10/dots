###########
#Variables#
###########

date=$(date "+%Y-%m-%d")
time=$(date "+%I:%M %p")

##########
#Commands#
##########

#Audio
audio_volume=$(pamixer --get-volume)
audio_is_muted=$(pamixer --get-volume-human)

#Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
ping=$(ping -c 1 www.google.ca | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

#Memory
used_memory=$(free -m | awk '/Mem/{print $3}')

#Cpu
used_cpu=$(top -bn1 | awk '/Cpu/ {print $2}')

if ! [ $network ]
then
   network_active="󰈂"
else
   network_active="󰈁"
fi

if [ $audio_is_muted = "muted" ]
then
    audio_active='󰖁'
else
    audio_active='󰕾'
fi

echo "CPU: $used_cpu% | MEM: $used_memory MiB | $network_active $network ($ping ms) | $audio_active $audio_volume% | $date  $time"
