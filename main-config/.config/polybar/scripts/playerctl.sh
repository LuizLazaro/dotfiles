#!/bin/bash

title=$(playerctl metadata -f '{{title}}' 2>/dev/null)
artist=$(playerctl metadata -f '{{artist}}' 2>/dev/null)
title_excerpt=$(echo "$title" | sed -E 's/(.{50}).+/\1.../')

prev=$(echo "%{A1:playerctl previous:}玲%{A}")
play_pause=$(echo %{A1:playerctl play-pause:}$(playerctl status 2>/dev/null | grep Playing >/dev/null && echo '' || echo '契')%{A} )
forward=$(echo %{A1:playerctl next:}怜%{A})

echo "$title_excerpt - $artist  %{F#80FFFFFF} $prev  $play_pause  $forward%{F-}"
