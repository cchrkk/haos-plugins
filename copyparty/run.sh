#!/bin/bash

# Create directories for sharing
mkdir -p "${CONFIG_FOLDER:-/share/copyparty/config}"
mkdir -p /share/copyparty/data

# Create shared folders
for folder in "${SHARED_FOLDERS[@]}"; do
  mkdir -p "$folder"
done

# Set permissions
chown -R copyparty:copyparty /share/copyparty

# Create initial config if it doesn't exist
CONFIG_FILE="${CONFIG_FOLDER:-/share/copyparty/config}/copyparty.conf"
if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<EOF
[users]
${ADMIN_USER:-admin}:${ADMIN_PASSWORD:-password}:admin

[volumes]
# Shared folders
$(for folder in "${SHARED_FOLDERS[@]}"; do
  folder_name=$(basename "$folder")
  echo "$folder_name:$folder"
done)

# Default data folder
data:/share/copyparty/data
EOF
fi

# Start copyparty
python3 copyparty.py -c "${CONFIG_FOLDER:-/share/copyparty/config}" --host 0.0.0.0 --port 8080