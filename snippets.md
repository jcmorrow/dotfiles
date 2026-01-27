Command: find ~/.config -xtype l -delete
Purpose: Cleans dangling symlinks. Useful for dotfiles especially. Note that
this works with GNU `find`, but not BSD `find`.

Command: du -sh /path/to/folder/* | sort -hr
Purpose: Query the size of folders inside of a directory.
