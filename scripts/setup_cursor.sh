#!/usr/bin/env zsh

# Ensure system and Homebrew binaries are on PATH even in a minimal environment
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${PATH}"

echo "Installing Cursor extensions..."

if ! command -v cursor &> /dev/null; then
    echo "cursor CLI not found. Install Cursor first, then re-run."
    exit 1
fi

extensions_file="${0:A:h}/../cursor/extensions.txt"

if [[ ! -f "${extensions_file}" ]]; then
    echo "Extension list not found: ${extensions_file}"
    exit 1
fi

# Install any extension that isn't already present
installed=$(cursor --list-extensions)

while IFS= read -r ext; do
    [[ -z "${ext}" ]] && continue
    if echo "${installed}" | grep -qix "${ext}"; then
        echo "  ${ext} already installed, skipping"
    else
        cursor --install-extension "${ext}"
    fi
done < "${extensions_file}"

echo "Cursor extensions installed!"
