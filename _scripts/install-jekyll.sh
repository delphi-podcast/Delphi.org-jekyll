#!/bin/bash
# System-level bootstrap for Jekyll. Run this once with sudo.

# 1. Root Check
if [[ $EUID -ne 0 ]]; then
    echo "Error: This bootstrap script must be run with sudo." >&2
    exit 1
fi

# 2. Identify target user
TARGET_USER=${SUDO_USER:-$USER}
USER_HOME=$(eval echo "~$TARGET_USER")

# 3. Install System Dependencies
echo "Updating packages and installing Ruby development tools..."
apt update && apt install -y ruby-full build-essential ruby-dev

# 4. Configure Gem behavior for the user
GEMRC="$USER_HOME/.gemrc"
if ! grep -q "gem: --user-install" "$GEMRC" 2>/dev/null; then
    echo "Configuring --user-install in $GEMRC..."
    echo "gem: --user-install" >> "$GEMRC"
    chown "$TARGET_USER:$TARGET_USER" "$GEMRC"
fi

# 5. Delegate to User-Level Setup
echo "System dependencies installed. Handing off to user-level initialization..."
sudo -u "$TARGET_USER" -i bash -c "cd '$PWD' && ./_scripts/init-jekyll.sh"
