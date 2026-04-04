#!/bin/bash
# Starts the Jekyll server, auto-fixing missing dependencies and opening the browser.

# Ensure we are in the project root
[[ "$(basename "$PWD")" == "_scripts" ]] && cd ..

# --- 1. Basic Pathing & Ruby Check ---
if ! command -v ruby &> /dev/null; then
    echo "Error: Ruby is missing. Run 'sudo ./_scripts/install-jekyll.sh' first."
    exit 1
fi

USER_GEM_BIN=$(ruby -e 'puts Gem.user_dir')/bin
export PATH="$USER_GEM_BIN:$PATH"

# --- 2. Check for missing environment ---
if ! command -v bundle &> /dev/null || ! command -v jekyll &> /dev/null || [ ! -d ".bundle" ] || ! bundle check &> /dev/null; then
    echo "Prerequisites missing or gems out of sync. Running initialization..."
    ./_scripts/init-jekyll.sh || exit 1
fi

# --- 3. Browser Opener (Background) ---
open_browser() {
    local url="http://127.0.0.1:4000"
    local count=0
    # Wait for the server to be up (max 30 seconds)
    while ! curl -s --head "$url" &> /dev/null; do
        sleep 1
        ((count++))
        if [ $count -gt 30 ]; then return; fi
    done
    
    echo "Server is up! Opening $url..."
    if command -v xdg-open &> /dev/null; then
        xdg-open "$url"
    elif command -v open &> /dev/null; then
        open "$url"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        start "$url"
    fi
}

open_browser &

# --- 4. Run Jekyll ---
echo "Environment ready. Starting Jekyll server..."
bundle exec jekyll serve --livereload
