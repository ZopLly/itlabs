#!/bin/bash
echo 'PID     START'
ps u | awk '{print $2, " ", $9}' | tail -n1
