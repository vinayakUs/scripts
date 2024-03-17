#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -p, --password <password>   Set the root password"
    echo "  -h, --help                  Display this help message"
    exit 1
}

# Default password
ROOT_PASSWORD="Vinayakpassword"

# Parse command-line options
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -p|--password)
            ROOT_PASSWORD="$2"
            shift
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $key"
            usage
            ;;
    esac
done

# Install ubuntu-desktop-minimal
echo "Installing ubuntu-desktop-minimal..."
apt install ubuntu-desktop-minimal -y

# Wait for 5 seconds
sleep 5

# Install xrdp
echo "Installing xrdp..."
apt install xrdp -y

# Wait for 5 seconds
sleep 5

# Change root password
echo "Changing root password..."
echo "root:$ROOT_PASSWORD" | sudo chpasswd

# Wait for 5 seconds
sleep 5

# Check xrdp status
echo "Checking xrdp status..."
systemctl status xrdp

# Wait for 5 seconds
sleep 5

# Start xrdp service
echo "Starting xrdp service..."
sudo systemctl start xrdp

# Wait for 5 seconds
sleep 5

# Enable xrdp service to start on boot
echo "Enabling xrdp service to start on boot..."
sudo systemctl enable xrdp

# Wait for 5 seconds
sleep 5

# Allow connections through port 3389
echo "Allowing connections through port 3389..."
ufw allow 3389

# Wait for 5 seconds
sleep 5

# Reload ufw
echo "Reloading ufw..."
ufw reload

# Wait for 5 seconds
sleep 5

# Display ufw status
echo "Displaying ufw status..."
ufw status

# Wait for 5 seconds
sleep 5

# Reboot the system
echo "Rebooting the system..."
reboot
