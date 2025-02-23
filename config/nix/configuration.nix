{ config, pkgs, ... }:
{
  # Enable fish shell
  programs.fish.enable = true;
  users.users.yourUsername = {
    shell = pkgs.fish;
    # ... other user configuration
  };

  # Configure Nix package manager
  nix.settings = {
    # Any other nix.conf settings can go here
    allow-unfree = true;
  };
}
