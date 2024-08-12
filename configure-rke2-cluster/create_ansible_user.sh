#!/bin/bash

# Function to check if a command was successful
check_success() {
  if [ $? -eq 0 ]; then
    echo "$1 succeeded."
  else
    echo "$1 failed. Exiting."
    exit 1
  fi
}

# Prompt for the username and password
read -p "Enter the username you want to create: " username
read -s -p "Enter the password for the new user: " password
echo

# Create the new user
sudo useradd -m -s /bin/bash "$username"
check_success "User creation"

# Set the password for the new user
echo "$username:$password" | sudo chpasswd
check_success "Setting password"

# Add the user to the sudoers file
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$username" > /dev/null
check_success "Adding user to sudoers"

echo "User $username created and given sudo privileges."
