# Dotfiles!

Because loving your tools means loving your work.

# Prerequisites

- [Homebrew](https://docs.brew.sh/Installation)
- [rcm](https://github.com/thoughtbot/rcm) (`brew install rcm`)
- nvim (`brew install nvim`)
- Kitty (`brew install kitty`)
- fish (`brew install fish`)

# MacOS Fish Usage

You might need to add the fish installation location (`/opt/homebrew/bin/fish`)
to `/etc/shells` in order to then run `chsh -u <username> -s
/opt/homebrew/bin/fish`.

# Installation

- Make sure the pre-requisites are installed
- Clone this repo and put it in `~/dotfiles`
- Run `rcup -d ~/dotfiles`
- Don't forget to run `:PackerSync` upon starting nvim
