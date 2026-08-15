{ config, pkgs, lib, ...}: {
  home.packages = with pkgs; [
    mpc
    rmpc
    unison
  ];

  home.file = {
    "Music/music-sync.sh".source = scripts/music-sync.sh;
  };

  services.mpd = {
    enable = true;

    musicDirectory = config.xdg.userDirs.music;
    playlistDirectory = "${config.xdg.configHome}/mpd/playlists";
    dataDir = "${config.xdg.cacheHome}/mpd";

    extraConfig = ''
      state_file "${config.xdg.stateHome}/mpd/state"
      sticker_file "${config.xdg.cacheHome}/mpd/sticker.sql"
    '';

    network.startWhenNeeded = true;
  };
}
