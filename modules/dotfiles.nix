# From https://blog.daniel-beskin.com/2025-10-18-symlinking-home-manager

{ config, lib, ... }:

let
  inherit (lib) mkOption types;

  cfg = config.dotfiles;

  link = name:
    config.lib.file.mkOutOfStoreSymlink
      "${cfg.root}/${name}";

  linkFile = name: {
    "${name}".source = link name;
  };

  linkDir = name: {
    "${name}" = {
      source = link name;
      recursive = true;
    };
  };

  links = lib.foldl'
    (acc: attrs: acc // attrs)
    {}
    (
      map linkFile cfg.confFiles
      ++ map linkDir cfg.confDirs
    );
in
{
  options.dotfiles = {
    root = mkOption {
      type = types.str;
      default = "/home/treeman/.config/home-manager/dotfiles";
      description = "Root directory containing the dotfiles.";
    };

    confFiles = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "Individual configuration files to link.";
    };

    confDirs = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "Configuration directories to link recursively.";
    };
  };

  config.xdg.configFile = links;
}

