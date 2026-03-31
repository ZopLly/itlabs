#!/bin/bash
info=$(mktemp)
warnin=$(mktemp)
grep '(WW)' /var/log/Xorg.0.log | sed "s/(WW)/Warning:/" > "$info"
grep '(II)' /var/log/Xorg.0.log | sed "s/(II)/Information:/" > "$warnin"
cat "$info" "$warnin" > full.log
cat full.log
rm "$info" "$warnin"
