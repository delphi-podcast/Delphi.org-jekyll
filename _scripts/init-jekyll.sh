#!/bin/bash
# Ensures Jekyll/Bundler are installed and project gems are synced.

# Ensure we are in the project root
[[ "$(basename "$PWD")" == "_scripts" ]] && cd ..

# --- 1. Check for Ruby ---
if ! command -v ruby &> /dev/null; then
    echo "Error: Ruby is missing. Run 'sudo ./_scripts/install-jekyll.sh' first."
    exit 1
fi

# --- 2. Setup PATH for the session ---
# This ensures we find the user-level gem binaries.
USER_GEM_BIN=$(ruby -e 'puts Gem.user_dir')/bin
export PATH="$USER_GEM_BIN:$PATH"

# --- 3. Install core gems if missing ---
if ! command -v jekyll &> /dev/null; then
    echo "Jekyll gem missing. Installing..."
    gem install jekyll --user-install
fi

if ! command -v bundle &> /dev/null; then
    echo "Bundler gem missing. Installing..."
    gem install bundler --user-install
fi

# --- 4. Sync Project Dependencies ---
echo "Syncing project gems via Bundler..."
bundle config set --local path '.bundle' # Ensure gems stay local to project
bundle install

echo "User environment ready."
