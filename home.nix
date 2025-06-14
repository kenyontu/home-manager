{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "k";
  home.homeDirectory = "/home/k";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    xsel
    pulseaudio
    acpi
    scrot
    bluetui
    # libva

    waybar
    hyprpaper
    wofi

    miniserve
    p7zip
    btop
    kitty
    zsh
    starship
    tmux
    yazi
    neovim
    the-way
    ripgrep
    fd
    ffmpeg
    fzf
    lsd
    # lua51Packages.tiktoken_core
    lynx
    # epson-escpr
    # epson-escpr2

    librewolf
    # quickemu
    gimp
    anki
    # ollama-rocm
    obsidian
    chromium
    zoom-us
    immersed
    bruno

    git
    gh
    lazygit

    rustup

    nodejs
    nodePackages.prettier
    nodePackages.jsonlint

    luajitPackages.jsregexp

    eslint
    tailwindcss
    prettierd

    vscode-langservers-extracted
    svelte-language-server
    typescript-language-server
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".xinitrc".source = ./dotfiles/.xinitrc;

    ".zshrc".source = ./dotfiles/.zshrc;

    ".prettierrc".source = ./dotfiles/.prettierrc;

    ".tmux.conf".source = ./dotfiles/.tmux.conf;

    ".config/starship.toml".source = ./dotfiles/starship.toml;

    ".config/kitty" = {
      source = ./dotfiles/kitty;
      recursive = true;
    };

    ".config/nvim" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };

    ".config/the-way/.the-way.toml" = {
      source = ./dotfiles/.the-way.toml;
    };

    ".config/hypr" = {
      source = ./dotfiles/hypr;
      recursive = true;
    };

    ".config/waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/k/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    THE_WAY_CONFIG = "${config.home.homeDirectory}/.config/the-way/.the-way.toml";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    LIBVA_DRIVER_NAME = "radeonsi";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.gh.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };
}
