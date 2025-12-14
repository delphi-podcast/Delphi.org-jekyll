#!/bin/bash
# This script starts the Jekyll server for local preview.

# --- Setup Gem Path ---
USER_GEM_INSTALL_DIR=$(gem environment user_installation_dir)
USER_GEM_BIN_PATH="$USER_GEM_INSTALL_DIR/bin"

# --- Check for local gems ---
if [ ! -d ".bundle" ]; then
    echo "The .bundle directory is missing. Please run './_scripts/init-jekyll.sh' first."
    exit 1
fi

# --- Run Jekyll ---
echo "Starting Jekyll server..."
$USER_GEM_BIN_PATH/bundle exec jekyll serve --livereload
