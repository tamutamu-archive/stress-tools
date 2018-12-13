#!/bin/bash -eu


expr ${1} + 1 > /dev/null

if [ ${1} -gt 90 ]; then
  echo "Error. Less than 90"
  exit 1
fi


TOTAL_MEM=$(free | sed -n '2,1p' | awk '{ print $2 }')
AVAILABLE_MED=$(free | sed -n '2,1p' | awk '{ print $7 }')

TARGET_MEM_SIZE=$(echo "scale=2; ${TOTAL_MEM} * (${1} / 100)" | bc)
CREATE_MEM_SIZE=$(echo "(${TARGET_MEM_SIZE} - (${TOTAL_MEM} - ${AVAILABLE_MED})) / 1024" | bc)

stress-ng -m 1 --vm-bytes ${CREATE_MEM_SIZE}m --vm-hang 0
