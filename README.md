# dotfiles

My personal dotfiles for MacOS

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

This script uses Dotbot for setting up the environment, linking files, and more. It will automatically handle the installation and setup process defined in `install.conf.yaml`.

## Tools and Applications Included

### Homebrew Packages and Casks

- **Packages**: `thefuck`, `watchman`, `starship`, `volta`
- **Applications**:
  - Browsers: `google-chrome`
  - Development tools: `iterm2`, `visual-studio-code`, `postman`, `xcodes`
  - Utilities: `rectangle`, `raycast`, `openinterminal`, `1password`
  - Communication: `slack`, `whatsapp`
  - Media: `vlc`

### Fonts

- `font-hack-nerd-font` for enhanced terminal and coding experience.

### Oh-my-zsh Configuration

- `oh-my-zsh` as the foundation
- Useful bundles like `git`, `web-search`, `docker`, `kubernetes`
- Syntax highlighting and autosuggestions for a better terminal experience
- The `robbyrussell` theme for Zsh
