#!/bin/bash
source common.sh
for acct in ${workshop_accounts[@]}; do
    delete_user "${acct}"
done
