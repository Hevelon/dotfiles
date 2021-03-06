#!/usr/bin/env bash

killall -q polybar

# # while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# while pgrep -x polybar >/dev/null; do sleep 1; done
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do

#     MONITOR=$m polybar --reload up &
#     MONITOR=$m polybar --reload down &
#   done
# else
#   polybar --reload up &
#   polybar --reload down &
# fi

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload up &
    MONITOR=$m polybar --reload down &
    ... and so on
done