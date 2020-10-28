# Workshop Account Scripts

Manage temporary workshop accounts (on a Linux system)


## Script files

- `common.sh` -- defines variables or functions used by multiple other scripts
- `create_accounts.sh` -- create local system accounts from a list of usernames and passwords in a text file
- `create_instructor_passwords.sh` -- generate a list of random passwords for instructor accounts
- `create_workshop_passwords.sh` -- generate a list of random passwords for workshop accounts
- `delete_instructor_accounts.sh` -- delete the instructor accounts (uid, gid, home, etc.)
- `delete_workshop_accounts.sh` -- delete the workshop accounts (uid, gid, home, etc.)

## Dependencies

The scripts are written for the `bash` shell and may not work with other shells.

The following external commands are used:
- cat
- fold
- getent
- head
- openssl
- tr
- useradd
- userdel

All external commands are found in `common.sh`; everything else is pure bash.

## Usage

### Generate Password List

This can be done well ahead of the workshop. Usernames and passwords can be distributed to participants before the accounts are created.

The script prints a tab-separated list of workshop accounts and random passwords. Redirect the output to a file for later use.

```bash
bash create_workshop_passwords.sh > {DATE}.workshop
bash create_instructor_passwords.sh > {DATE}.instructors
```

### Create Accounts

This can be done when it is time to enable access for workshop participants. The `create_accounts.sh` script will attempt to create local system accounts with the usernames and passwords from a file.

```bash
bash create_accounts.sh {DATE}.workshop
bash create_accounts.sh {DATE}.instructors
```

### Delete Accounts

Delete the temporary accounts and their home directories after the workshop is over.

```bash
bash delete_workshop_accounts.sh
bash delete_instructor_accounts.sh
```
