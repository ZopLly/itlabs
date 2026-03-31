#!/bin/bash
grep -r -h "ACPI" /var/log/ > errors.log
echo $?
grep '/' errors.log

