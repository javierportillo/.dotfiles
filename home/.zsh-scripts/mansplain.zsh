#!/usr/bin/env zsh

man -k . | rofi -dmenu -l 30 | awk '{print $1}' | xargs -r man -Tpdf | zathura -
