Command: find ~/.config -xtype l -delete
Purpose: Cleans dangling symlinks. Useful for dotfiles especially. Note that
this works with GNU `find`, but not BSD `find`.
