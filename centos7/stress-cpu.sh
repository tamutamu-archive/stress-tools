#!/bin/bash -eu

expr ${1} + 1 > /dev/null

if [ ${1} -gt 90 ]; then
  echo "Error. Less than 90"
  exit 1
fi

CPUS=$(cat /proc/cpuinfo | grep processor | wc -l)

stress-ng -c ${CPUS} -l ${1}
