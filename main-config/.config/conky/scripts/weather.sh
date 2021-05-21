#!/bin/bash

raw_weather=$(curl 'wttr.in/?format=1')
regexp=".+([\+\-]{1})([0-9]+).{2}"

[[ $raw_weather =~ $regexp ]]

sign="${BASH_REMATCH[1]}"
number="${BASH_REMATCH[2]}"

sun=$(echo "$raw_weather" | grep "☀️")
sun_cloud=$(echo "$raw_weather" | grep "⛅")
cloudy=$(echo "$raw_weather" | grep "☁️")
rain=$(echo "$raw_weather" | grep "🌧")
rain_thunder=$(echo "$raw_weather" | grep "⛈")
snow=$(echo "$raw_weather" | grep "❄️")

case "${raw_weather}" in
  "$sun")
    emoji="盛 "
  ;;
  "$sun_cloud")
    emoji=" "
  ;;
  "$cloudy")
    emoji=" "
  ;;
  "$rain")
    emoji=" "
  ;;
  "$rain_thunder")
    emoji=" "
  ;;
  "$snow")
    emoji=" "
  ;;
  *)
    echo "temp"
  ;;
esac

if [ "$sign" = "-" ]; then
  echo "${emoji}"'${font SF Pro Display:italic:size=10}'"${sign}${number}°C"'${font}'
else
  echo "${emoji}"'${font SF Pro Display:size=10}'"${number}°C"'${font}'
fi
