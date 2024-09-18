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
    # Use all alphanumeric characters
    #pwchars='A-Za-z0-9'
    # Avoid graphically similar characters (0Oo 1Il 2Z 5S 8B)
    pwchars='34679AC-HJ-NPQRT-Ya-kmnp-z'
    new_password=$(cat /dev/urandom | tr -dc "${pwchars}" | fold -w ${password_length} | head -n 1)
    echo "${new_password}"
}
workshop_accounts=$(echo workshop{01..75})
instructor_accounts=$(echo instructor{01..05})

