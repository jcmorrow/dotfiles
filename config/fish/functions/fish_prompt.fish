function fish_prompt
    # Save the status from the last command
    set -l last_status $status

    # Set different colors or indicators based on SHLVL
    set -l shell_level $SHLVL
    set -l shell_indicator ""

    # Define shell level indicator
    switch $shell_level
        case 1
            # Default shell (level 1), no special indicator
            set shell_indicator ""
        case 2
            # One subshell deep (level 2)
            set shell_indicator "[2] "
        case 3
            # Two subshells deep (level 3)
            set shell_indicator "[3] "
        case '*'
            # More than two subshells deep
            set shell_indicator "[$shell_level] "
    end

    # Add Nix-specific indicator if in Nix shell
    if set -q IN_NIX_SHELL
        set shell_indicator $shell_indicator"[nix] "
    end

    # Print the current directory
    echo -n (set_color cyan)(prompt_pwd)(set_color normal)

    # Display git branch if applicable
    if command -sq git
        and test -d .git; or git rev-parse --git-dir > /dev/null 2>&1
        set -l git_branch (git branch --show-current 2>/dev/null)
        echo -n (set_color bryellow)" ($git_branch)"(set_color normal)
    end

    # Print shell level indicator and prompt character
    echo
    echo -n "$shell_indicator"

    # Different prompt symbol based on last command status
    if test $last_status -eq 0
        echo -n (set_color green)'❯ '
    else
        echo -n (set_color red)'❯ '
    end

    set_color normal
end
