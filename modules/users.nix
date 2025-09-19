# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oxdopeduck = {
    isNormalUser = true;
    description = "0xdopeduck";
    extraGroups = [ "networkmanager" "wheel" "libvirt" "kvm" "adbusers" "video" ];
    initialPassword = "changeme";
    createHome = true;
    useDefaultShell = true;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  environment.sessionVariables = {
    PATH = [ "$HOME/.local/bin" ];
  };

  programs.zsh.enable = true;

}
