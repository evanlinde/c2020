#!/bin/bash
source common.sh
for acct in ${instructor_accounts[@]}; do
    password=$(random_password)
    printf "%s\t%s\n" "${acct}" "${password}"
done
