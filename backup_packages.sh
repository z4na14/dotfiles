#!/bin/bash
# Normal packages
pacman -Qentq >packages-copy.txt
# AUR packages
pacman -Qmeqt >aur-packages-copy.txt
