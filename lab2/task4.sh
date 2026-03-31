grep -h -r -a -I "^#\\!" /bin | sort | uniq -c | sort -nr | head -1 | awk '{print  $2}'
