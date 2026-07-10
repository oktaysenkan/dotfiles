# dotfiles

My personal dotfiles for macOS

<img width="682" alt="Screenshot 2024-05-08 at 17 57 18" src="https://github.com/oktaysenkan/dotfiles/assets/42527467/df10e9d8-3a57-42f4-84ec-83d3e580dcab">

## Prerequisites

Make sure you have the following installed:

- git
- [Homebrew](https://brew.sh/)

## Installation

To get started with these dotfiles, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/oktaysenkan/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the installation script:**

   ```bash
   ./install
   ```

This uses [Dotbot](https://github.com/anishathalye/dotbot) to link the config
files and run the setup scripts defined in `install.conf.yaml`. It is safe to
re-run — everything is idempotent.

## What `./install` does

### Linked configs

| Target | Source |
| --- | --- |
| `~/.profile`, `~/.zprofile`, `~/.zshrc` | `profile`, `zprofile`, `zshrc` |
| `~/.gitconfig`, `~/.gitignore_global` | `gitconfig`, `gitignore_global` |
| `~/antigen.zsh`, `~/.antigenrc` | `antigen`, `antigenrc` |
| `~/.config/starship.toml` | `starship.toml` |
| `~/.config/zed/*` | `zed/*` (glob) |
| `~/Library/Application Support/Cursor/User/settings.json` | `cursor/settings.json` |

### Setup scripts (`scripts/`)

| Script | Purpose |
| --- | --- |
| `setup_brew.sh` | Install Homebrew and everything in the `Brewfile` |
| `setup_oh_my_zsh.sh` | Install oh-my-zsh |
| `setup_node.sh` | Install Node.js (via Volta) |
| `setup_macos.sh` | Apply macOS defaults (Dock, Finder, screenshots, trackpad, menu bar, security) |
| `setup_finder_sidebar.sh` | Add folders (e.g. `~/Developer`) to the Finder sidebar via `mysides` |
| `setup_iterm2.sh` | Point iTerm2 at the vendored prefs in `iterm2/` |
| `setup_cursor.sh` | Install the Cursor extensions listed in `cursor/extensions.txt` |

## Tools and Applications

### Homebrew

- **Packages**: `thefuck`, `watchman`, `starship`, `volta`, `git-recent`,
  `cocoapods`, `fastlane`, `gh`, `ffmpeg`, `webp`, `cloudflared`, `mysides`
- **Development**: `iterm2`, `zed`, `visual-studio-code`, `postman`,
  `xcodes-app`, `android-studio`, `expo-orbit`, `gcloud-cli`, `zulu@17`
- **Browsers**: `google-chrome`
- **Utilities**: `rectangle`, `raycast`, `openinterminal`, `1password`,
  `setapp`, `handbrake-app`, `meetingbar`
- **Communication**: `slack`, `whatsapp`, `discord`
- **Media**: `vlc`, `spotify`
- **AI**: `chatgpt`

### Fonts

- `font-hack-nerd-font`, `font-geist-mono-nerd-font`, `font-martian-mono-nerd-font`

### Editors

- **Zed** — keymap, settings, `Bearded Vivid Black` theme, and
  React / React Native / TypeScript snippets (`zed/`)
- **Cursor** — settings plus a tracked extension list (`cursor/`)

### Shell

- `oh-my-zsh` with bundles: `git`, `web-search`, `command-not-found`,
  `thefuck`, `kubernetes`
- `zsh-syntax-highlighting` and `zsh-autosuggestions`
- [Starship](https://starship.rs/) prompt
