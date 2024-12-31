# Home Manager Configuration

Manages installed applications and my dotfiles.

# Fresh setup

Clone to `~/.config/home-manager`, then run:

```sh
home-manager switch
```

## Manual steps

### Tmux

Open `tmux` and press `Ctrl + b, I` to install `tmp` plugins

### Neovim plugins

The Neovim plugins will require a few dependencies. To make things easy, there's a `shell.nix` file in the root of this repo, so just run:

```sh
nix-shell
```

To create a nix-shell containing them, then open `nvim` and let `Lazy.nvim` install all plugins.
