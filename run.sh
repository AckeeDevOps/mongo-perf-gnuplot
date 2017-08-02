#!/bin/bash

host="$1"
user="$2"
pw="$3"
rs="$4"
output="$5"

# host 1
python benchrun.py --host "$host" --replset "$rs" -u "$user" -p "$pw" -f testcases/* --includeFilter insert update  -t 1 2 4 8 16 32 64 128 --out "$output"

