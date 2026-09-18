#!/bin/bash
# Скрипт для ежедневной очистки логов лабораторной работы

LOG_DIR="/home/andrew/projects/labs/lab4/logs"
mkdir -p "$LOG_DIR"

echo "Очистка запущена: $(date)" >> "$LOG_DIR/clean_report.log"

# Удаляем временные файлы старше 7 дней
find /tmp -name "lab4_*" -type f -mtime +7 -delete 2>/dev/null

# Выводим сообщение в системный лог (можно проверить через journalctl)
logger "Лабораторная работа 4: выполнена ежедневная очистка"
