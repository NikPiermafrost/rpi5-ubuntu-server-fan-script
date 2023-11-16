#!/bin/bash

temp=$(/usr/bin/vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')

if (( $(echo "$temp < 60" | bc -l) )); then
    temp=1
elif (( $(echo "$temp < 68" | bc -l) )); then
    temp=2
elif (( $(echo "$temp < 75" | bc -l) )); then
    temp=3
else
    temp=4
fi

echo $temp > /sys/class/thermal/cooling_device0/cur_state