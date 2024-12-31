# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="refined"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use powerline
USE_POWERLINE="true"

# Env variables
export PATH=$PATH:~/bin
export PATH=$PATH:~/scripts

source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
source <(fzf --zsh)

# Aliases
alias hm="nvim ~/.config/home-manager/home.nix"
alias ls=lsd

alias tw="the-way search"
alias twa="the-way new"

alias ta="tmux a"
alias tl="tmux ls"

alias t="task"
alias tn"task add"

# Trash-cli
alias rm='echo "Use trash-put <file> instead."; false'

# Taskwarrior aliases
#alias t="task"
#alias ta="task add"
#alias tn="while true; do clear && task next limit:5; sleep 5; done"

# pactl aliases
# For managing audio interfaces
alias sinks="pactl list sinks short"
alias ssink="pactl set-default-sink"

alias vol0="pactl set-sink-volume @DEFAULT_SINK@ 0.0"
alias vol5="pactl set-sink-volume @DEFAULT_SINK@ 0.05"
alias vol10="pactl set-sink-volume @DEFAULT_SINK@ 0.1"
alias vol20="pactl set-sink-volume @DEFAULT_SINK@ 0.2"
alias vol30="pactl set-sink-volume @DEFAULT_SINK@ 0.3"
alias vol40="pactl set-sink-volume @DEFAULT_SINK@ 0.4"
alias vol50="pactl set-sink-volume @DEFAULT_SINK@ 0.5"
alias vol60="pactl set-sink-volume @DEFAULT_SINK@ 0.6"
alias vol70="pactl set-sink-volume @DEFAULT_SINK@ 0.7"
alias vol80="pactl set-sink-volume @DEFAULT_SINK@ 0.8"
alias vol90="pactl set-sink-volume @DEFAULT_SINK@ 0.9"
alias vol100="pactl set-sink-volume @DEFAULT_SINK@ 1.0"
alias svol="pactl set-sink-volume @DEFAULT_SINK@"

# Keyboard aliases
alias kbi="setxkbmap us -variant intl"
alias kb="setxkbmap us -variant \"\""

# Set starship as prompt
eval "$(starship init zsh)"

# Functions
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
