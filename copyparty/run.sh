#!/bin/bash

# Create directories for sharing
mkdir -p "${CONFIG_FOLDER:-/share/copyparty/config}"
mkdir -p /share/copyparty/data

# Create directories to be mounted in copyparty data folder
mkdir -p /homeassistant
mkdir -p /addons
mkdir -p /addon_configs

# Set permissions
chown -R copyparty:copyparty /share/copyparty
chown -R copyparty:copyparty /homeassistant
chown -R copyparty:copyparty /addons
chown -R copyparty:copyparty /addon_configs

# Create initial config if it doesn't exist
CONFIG_FILE="${CONFIG_FOLDER:-/share/copyparty/config}/copyparty.conf"
if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<EOF
[users]
${ADMIN_USER:-admin}:${ADMIN_PASSWORD:-password}:admin

[volumes]
# Default data folder
data:/share/copyparty/data

# Home Assistant directories
homeassistant:/homeassistant
addons:/addons
addon_configs:/addon_configs
EOF
fi

# Start copyparty
python3 copyparty.py -c "${CONFIG_FOLDER:-/share/copyparty/config}" --host 0.0.0.0 --port 8080