{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      # <nixos-hardware/lenovo/thinkpad/t420>
    ];


environment.systemPackages = with pkgs; [
    neovim
    git
    tmux
    kitty
    xdg-utils
    xdg-desktop-portal-wlr
    wev
    gh
    nvd
    spotatui
    obs-studio
    spotify
    spotify-player
    kew	
    fastfetch
    htop
    timeshift
    wireplumber
    brightnessctl
    mako
    killall
    btop
    firefox
    nwg-look
    curl
    cava
    # power-profiles-daemon
    tty-clock
    cmatrix
    calc
    yazi
    vesktop
    waybar
    waypaper
    swaybg
    networkmanagerapplet
    lsd
    microfetch
    pavucontrol
    bluez
    blueman
    sway-contrib.grimshot
    hyprpicker
    wl-clipboard 
    gcc
    foot
    rofi
    mpv
    yt-dlp
    freetube
    picom
    arc-theme
];

    fonts.packages = with pkgs; [
	noto-fonts
	terminus_font_ttf
    	noto-fonts-cjk-sans
    	noto-fonts-color-emoji
    	nerd-fonts.jetbrains-mono
    ];

# services
    services.openssh.enable = true;
    # services.power-profiles-daemon.enable = true;
    services.samba.enable = true;
    services.tailscale.enable = true;
    programs.sway.enable = true;
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    programs.nh.enable = true;
    hardware.bluetooth.enable = true;

# login
    services.displayManager.ly.enable = false;
  

    users.users."korou" = {
	isNormalUser = true;
        description = "korou";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    programs.steam.enable = true;
    services.gvfs.enable = true;
    programs.thunar.enable = true;
    services.tumbler.enable = true;
    programs.xfconf.enable = true;

    programs.thunar.plugins = with pkgs.xfce; [
	thunar-volman
	thunar-archive-plugin
    ];

    #pipewire
	#    security.rtkit.enable = true;
	#    services.pipewire = {
	# enable = true;
	# alsa.enable = true;
	# alsa.support32Bit = true;
	# pulse.enable = true;
	# jack.enable = true;
	# wireplumber.enable = true;
	#    };

	#    services.pulseaudio.enable = false;
	#    services.pipewire = {
	# enable = true;
	# alsa.enable = true;
	# alsa.support32Bit = true;
	# pulse.enable = true;
	#    };


    #garbage collect
    #for manual run "sudo nix-collect-garbage -d" or "nix-collect-garbage --delete-older-than <NUMBER>d
    boot.loader.systemd-boot.configurationLimit = 10;  
    nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 7d";
    };
    
# power management 
    services.tlp = {
	enable = true;
	settings = {
	    CPU_SCALING_GOVERNOR_ON_AC = "performance";
	    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

            CPU_MIN_PERF_ON_AC = 0;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 60;
	};
    };

    services.thinkfan = {
	enable = true;
	settings = {
	    fan_speed = "level auto";
	    sensors = [
		{ name = "cpu"; hwmon = "/sys/class/hwmon/hwmon0/temp1_input"; }
	    ];
	    levels = [
              [0 0 55]    # Fan off below 55°
              [1 50 60]   # Low speed 50-60°C
              [3 55 65]   # Medium speed
              [7 60 85]   # Max speed
	    ];
	};
    };

    nix.settings.download-buffer-size = 524288000; #500mb
    boot.loader.systemd-boot.enable = true;
    nixpkgs.config.allowUnfree = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages;
    networking.hostName = "penrose"; # Hostname
    networking.networkmanager.enable = true;
    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
	LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };
    services.xserver.xkb = {
	layout = "us";
	variant = "";
    };
  
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05"; 

}
