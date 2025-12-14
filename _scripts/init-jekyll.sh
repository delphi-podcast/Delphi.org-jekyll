#!/bin/bash
# This script initializes the Jekyll environment for this project.

# Function to add a line to a file if it doesn't already exist
add_to_file_if_not_exists() {
  LINE=$1
  FILE=$2
  grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

# --- Check for Ruby ---
if ! command -v ruby &> /dev/null
then
    echo "Ruby could not be found. Please install Ruby."
    echo "For example, on Debian/Ubuntu: sudo apt install ruby build-essential ruby-dev ruby-full"
    echo "On other systems, please use your package manager (e.g., brew, yum, etc.)."
    exit 1
fi

# --- Check for Gem ---
if ! command -v gem &> /dev/null
then
    echo "gem could not be found. Please ensure your Ruby installation is correct and includes RubyGems."
    exit 1
fi

gem install jekyll --user-install
gem install bundler --user-install

bundle install