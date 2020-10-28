#!/bin/bash
source common.sh
infile=$1
if [[ ! -f ${infile} ]]; then
    echo "Input file needed!"
    exit 1
fi
while read username password; do
    create_user "${username}" "${password}"
done < "${infile}"
