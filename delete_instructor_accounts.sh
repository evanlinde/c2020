#!/bin/bash
source common.sh
for acct in ${instructor_accounts[@]}; do
    delete_user "${acct}"
done
