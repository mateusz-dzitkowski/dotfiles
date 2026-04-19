#!/bin/sh

usage=$(nvidia-smi --query-gpu=utilization.gpu --format=noheader,csv | cut -d " " -f1)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=noheader,csv)

echo "$usage% $temp°"
