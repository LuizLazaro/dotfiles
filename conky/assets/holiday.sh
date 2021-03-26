#!/bin/bash

readonly day=`date +%-d`
readonly string=`gcal -qbr -n .| grep -E '(.+) \(BR\).+<[ ]?(.{1,2})[thstnd]{2}>'`
readonly regexp="(.+) \(BR\).+<[ ]?(.{1,2})[thsnd]{2}>"

[[ $string =~ $regexp ]]

readonly holiday_name="${BASH_REMATCH[1]}"
readonly holiday_day="${BASH_REMATCH[2]}"

if [ "$holiday_day" == "$day" ];
then
        echo "$holiday_name"
else
  echo "ordinary day"
fi
