#!/bin/bash

get_holiday=`gcal -qbr -n .- | grep -w "0 days"`
holiday_name=${get_holiday%(BR)*}
holiday_date=`gcal -qbr -n .- | grep -woh "0 days"`

if [ "$holiday_date" == "10 days" ];
then 
    echo $holiday_name
else
    echo "Ordinary day"
fi
