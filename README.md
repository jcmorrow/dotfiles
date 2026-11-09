# Dotfiles!

Because loving your tools means loving your work.

# macOS

## Prerequisites

- [Homebrew](https://docs.brew.sh/Installation)
- [rcm](https://github.com/thoughtbot/rcm) (`brew install rcm`)
- nvim (`brew install nvim`)
- Ghostty (`brew install ghostty`)
- fish (`brew install fish`)

## Installation

1. Install the prerequisites.
2. Clone this repo to `~/dotfiles` and link everything into place:
   `rcup -d ~/dotfiles`
3. Install tmux plugins (see [tmux plugins](#tmux-plugins)).

## Fish

You might need to add the fish installation location (`/opt/homebrew/bin/fish`)
to `/etc/shells` in order to then run
`chsh -u <username> -s /opt/homebrew/bin/fish`.

# Linux (Ubuntu devbox)

1. Install rcm: `sudo apt install rcm`
2. Clone this repo to `~/dotfiles` and link everything into place:
   `rcup -d ~/dotfiles`
3. Install Neovim with `~/.bin/install_neovim`. Distro packages are often too
   old for the plugins (Ubuntu 24.04 ships 0.9.5), so this installs the official
   release to `~/.local`. Rerun it any time to update.
4. Open `nvim` once and let Lazy install the plugins.
5. Install tmux plugins (see [tmux plugins](#tmux-plugins)).

# tmux plugins

Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux (or run `tmux source-file ~/.tmux.conf` in a running one) and
press `prefix` + `I` to install the plugins.

# Updating

After `git pull`, reload tmux with `tmux source-file ~/.tmux.conf`. tmux only
reads its config at startup, so a long-running server keeps the old settings
until you do. Run `rcup -d ~/dotfiles` again if files were added.
