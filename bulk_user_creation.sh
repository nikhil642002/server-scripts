#!/bin/bash

CSV_FILE="users.csv"
DEFAULT_PASSWORD="Redhat123"

if [ ! -f "$CSV_FILE" ]; then
    echo "[!] CSV file '$CSV_FILE' not found!"
    exit 1
fi

while IFS=, read -r username groupname; do
    echo "[+] Creating user: $username in group: $groupname"
    
    # Create group if it doesn't exist
    if ! getent group "$groupname" > /dev/null; then
        groupadd "$groupname"
    fi

    # Create user and set group
    useradd -m -g "$groupname" "$username"
    
    # Set default password
    echo "$username:$DEFAULT_PASSWORD" | chpasswd

    # Set permissions
    chmod 750 /home/"$username"
    chown "$username":"$groupname" /home/"$username"

    echo "User $username created successfully."
done < "$CSV_FILE"
