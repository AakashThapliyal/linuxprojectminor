#!/bin/bash

# Function to generate random password
generate_password() {
    length=$1
    # Generate a random password using /dev/urandom and tr to filter characters
    tr -dc 'A-Za-z0-9' < /dev/urandom | head -c "$length"
    echo
}

# Ask the user for the desired password length
read -p "Enter the desired password length: " password_length

# Validate the input
if ! [[ "$password_length" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

# Generate and display the password
password=$(generate_password "$password_length")
echo "Generated Password: $password"

