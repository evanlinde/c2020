function create_user {
    username="$1"
    password="$2"
    getent passwd ${username} || useradd --create-home --password $(echo "${password}" | openssl passwd -1 -stdin) ${username}
}
function delete_user {
    username="$1"
    getent passwd ${username} && userdel --remove ${username}
}
function random_password {
    password_length=$(( 8 + $(( $RANDOM % 3 )) ))
    new_password=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w ${password_length} | head -n 1)
    echo "${new_password}"
}
workshop_accounts=$(echo workshop{01..75})
instructor_accounts=$(echo instructor{01..05})

