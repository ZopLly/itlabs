#!/bin/bash
ps u | awk '{ print $2 " " $11}'
