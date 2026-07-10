#!/usr/bin/env zsh

# Ensure system and Homebrew binaries are on PATH even in a minimal environment
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"

echo "Configuring Finder sidebar favorites..."

# Folders to add to the Finder sidebar Favorites (label -> path)
# NOTE: don't name the loop variable `path` — in zsh it is tied to $PATH.
FAVORITES=(
    "Developer:${HOME}/Developer"
)

if ! command -v mysides &> /dev/null; then
    echo "mysides not found. Install it with: brew install --cask mysides"
    exit 1
fi

for entry in "${FAVORITES[@]}"; do
    label="${entry%%:*}"
    dir="${entry#*:}"

    # Make sure the folder exists before adding it
    mkdir -p "${dir}"

    # Skip if a favorite with this label already exists
    if mysides list | grep -q "^${label} "; then
        echo "  '${label}' already in sidebar, skipping"
        continue
    fi

    mysides add "${label}" "file://${dir}/"
    echo "  Added '${label}' -> ${dir}"
done

# Restart Finder so the sidebar refreshes
killall Finder &> /dev/null

echo "Finder sidebar configured!"
