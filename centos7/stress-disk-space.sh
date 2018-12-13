#!/bin/bash -eu

expr ${1} + 1 > /dev/null

if [ ${1} -gt 90 ]; then
  echo "Error. Less than 90"
  exit 1
fi


ROOT_DISK_SIZE=$(df / | awk '{ print $2 }' | tail -n 1)
USED_DISK_PER=$(df / | awk '{ print $5 }' | tail -n 1 | sed -e 's/%//')

USED_DISK_SIZE=$(echo "scale=2; ${ROOT_DISK_SIZE} * (${USED_DISK_PER} / 100)"  | bc)

TARGET_USED_DISK_SIZE=$(echo "scale=2; ${ROOT_DISK_SIZE} * (${1} / 100)"  | bc)


CREATE_FILE_SIZE=$(echo "(${TARGET_USED_DISK_SIZE} - ${USED_DISK_SIZE}) / 1024" | bc)

echo "Create ./tempfile, size ${CREATE_FILE_SIZE}MB"
echo "Are you sure you want to proceed ? [Y/n]"
read ans
case $ans in
      "Y") 
        echo "Proceed !!";;
       * )
        echo "Stop !!"
        exit 1;;
esac

dd if=/dev/zero of=./tempfile bs=1M count=${CREATE_FILE_SIZE}
