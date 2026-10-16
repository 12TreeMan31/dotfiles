{ config, pkgs, lib, ... }:
let 
  inherit (lib) mkOption types;
in {
  options.desktop = {
    modkey = mkOption {  
      type = types.str;
      default = "Mod4";
      description = "Sway mod key";
    };

    focused = mkOption {
      type = types.attrsOf types.str;
      default = {
	    background = "#285577";
        border = "#4c7899";
  	    childBorder = "#285577";
  	    indicator = "#2e9ef4";
  	    text = "#ffffff";
      };
      description = "Sway theme colors";
    };
  };
  config = {
  # Needed for hm to work
  home.username = "treeman";
  home.homeDirectory = "/home/treeman";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Librewolf isnt in here bc the nix version doesn't work with extensions
    # you must also install sid-bg yourself
    grim		    # screenshot
    slurp		    # screenshot
    wl-clipboard	# screenshot
    imv			    # image viewer
    mpv             # video player
    mako		    # notifications
    kitty		    # term
    tofi		    # dmenu
    waybar		    # bar
    yazi		    # filepicker
    awww		    # desktop background
    mupdf           # pdf viewer
    bluetui
    impala
    wiremix
  ];

  systemd.user.packages = [
    # For some reason a nomral install will not give us access to the service
    pkgs.xdg-desktop-portal-termfilechooser
  ];

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    systemd.enable = true;
    extraConfig = "swaybg_command -";
    config = {
      modifier = config.desktop.modkey;
      defaultWorkspace = "workspace number 1";
      terminal = "kitty --single-instance";
      menu = "tofi-drun --drun-launch=true";
      bars = [{ command = "waybar"; }];
      window = {
        hideEdgeBorders = "none";
	    titlebar = false;
      };
      colors.focused = config.desktop.focused;
      startup = [
        { command = "mako"; }
      ];
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${mod}+p" = "exec slurp | grim -g - - | tee ~/tmp/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy";
        "${mod}+q" = "kill";
        "${mod}+SHIFT+p" = "exec slurp | grim -g - - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy";
        "${mod}+Shift+n" = "exec awww img $(sid-bg)";
        "${mod}+Shift+e" = "exec swaynag -t warning -y overlay -m 'Do you want to exit sway?' -b 'Yes' 'swaymsg exit'";
        "${mod}+Shift+q" = "exec kitty --single-instance impala";
        "${mod}+Shift+m" = "exec kitty --single-instance bluetui";
        "${mod}+Shift+w" = "exec kitty --single-instance wiremix";
        "${mod}+Shift+s" = "exec kitty --single-instance rmpc";
      };
      input = {
	"*" = {
	  scroll_method = "two_finger";
	};
      };
    };
  };

  xdg.userDirs = {
    enable = true;
    documents = "2-Documents";
    projects = "1-Projects";
    music = "/home/treeman/Music";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      xdg-desktop-portal-termfilechooser
    ];

    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [
        "termfilechooser"
      ];
    };
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];

      "application/pdf" = [ "mupdf.desktop" ];
      "application/epub" = [ "mupdf.desktop" ];

      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/bmp" = [ "imv.desktop" ];

      "video/mp4" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "video/mkv" = [ "mpv.desktop" ];

      "text/plain" = [ "nvim.desktop" ];
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      "hm" = "home-manager";
      "ls" = "ls --color";
      "code" = "vscodium";
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = true;
    font = {
      package = pkgs.fira-code;
      name = "Fira Code Regular";
    };
    extraConfig = "
      font_features FireCode-Regular +cv27 +ss08
      background_opacity 0.75
      scrollback_lines 1000
    ";
  };

  services.awww = {
    enable = true;
  };

  services.gammastep = {
    enable = true;
    longitude = -81.0;
    latitude = 41.0;
  };

  dotfiles.confDirs = [
    "tofi"
    "waybar"
    "mako"
    "xdg-desktop-portal-termfilechooser"
    "nvim"
  ];
	
  home.sessionVariables = {
    # Fix font rendering for java programs
    _JAVA_AWT_WM_NONREPARENTING= "1";
    # Fix issue where kitty doesn't play nice with ssh
    TERM= "xterm-256color";
    EDITOR= "nvim";
    # We need this in order to get yazi to work at the filepicker
    PATH = "/home/treeman/.nix-profile/bin:/usr/local/bin:/usr/bin";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Let OpenGL work without needing NixGL. During inital setup will prompt user to run a command.
  targets.genericLinux.enable = true;
  };
}
