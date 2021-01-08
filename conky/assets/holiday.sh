#!/bin/bash

holiday=`gcal -qbr -n | tail -1`

remaining_days=`gcal -qbr -n | tail -1 | grep -oh "0 days"`

if [ "$remaining_days" != "0 days" ];
then 
    echo "Ordinary day"
else
    today_holiday=${holiday%(BR)*}
    echo $today_holiday
fi