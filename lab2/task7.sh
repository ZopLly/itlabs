grep -E -o '\<[[:alpha:]]{4,}\>' bashman.txt | tr '[:upper:]' '[:lower:]' | uniq -c | sort -nr | head -3 | awk '{print $2}'
