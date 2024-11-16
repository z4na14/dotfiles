#!/usr/bin/env bash
killall -q polybar
sleep 0.2
polybar -c $HOME/.config/polybar/config.ini mybar &
disown
