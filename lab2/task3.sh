#!/bin/bash
grep -r -o -h -E -I "[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}" /etc/ > email.lst | paste -s -d ',' > email.lst
