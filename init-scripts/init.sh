#!/bin/bash

# create ssh key
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""

# list server need to add key
servers=(
    "ansible@loadbalancer"
    "ansible@app01"
    "ansible@app02"
    "ansible@database"
)
remote_password="ansible"
# Local SSH key file
ssh_key_file="$HOME/.ssh/id_rsa.pub"

# Check if SSH key file exists
if [ ! -f "$ssh_key_file" ]; then
    echo "SSH key file not found: $ssh_key_file"
    exit 1
fi

# Iterate over the list of servers and copy SSH public key
for server in "${servers[@]}"; do
    # Extract username and hostname from server string
    username=$(echo "$server" | cut -d "@" -f 1)
    hostname=$(echo "$server" | cut -d "@" -f 2)

    echo "Copying SSH public key to $server..."

    # Copy SSH public key to remote server
    # sshpass -p "ansible" ssh-copy-id -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no ansible@"{$server}"
    sshpass -p "$remote_password" ssh-copy-id -o StrictHostKeyChecking=no "$server" < "$ssh_key_file"

    # Check if ssh-copy-id was successful
    if [ $? -eq 0 ]; then
        echo "SSH public key copied to $hostname for user $username"
    else
        echo "Failed to copy SSH public key to $hostname for user $username"
    fi
done

while true; do
    sleep 10  # Adjust sleep time as needed
done