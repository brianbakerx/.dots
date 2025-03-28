# Set the working directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Prompt - https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

prompt pure

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=100000                 # Size of zsh history
HISTFILE=~/.zsh_history       # File containing history
SAVEHIST=$HISTSIZE            # Same as HISTSIZE
HISTDUP=erase                 # Erase duplicates in history file
setopt appendhistory          # Append commands to history file
setopt sharehistory           # Share history between sessions
setopt hist_ignore_space      # Don't save when prefixed with space
setopt hist_ignore_all_dups   # Ignore all dupes
setopt hist_save_no_dups      # Don't save dupes
setopt hist_ignore_dups       # Ignore dupes
setopt hist_find_no_dups      # Prevent dupes in history search

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

#Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
alias l='ls -l --color'
alias lk='ls -lathr --color'
alias ll='ls -lAh --color'
alias vim='nvim'
alias c='clear'
alias ..='cd ..'
alias ~='cd ~'
alias zshconfig="vim ~/.zshrc"
alias kittyconfig="vim ~/.config/kitty/kitty.conf"
alias nvimconfig="vim ~/.config/nvim/init.lua"
alias vimconfig="vi ~/.vimrc"
alias vim-k='NVIM_APPNAME="nvim-kickstart" nvim'
alias vim-q='NVIM_APPNAME="nvim-quarto" nvim'
alias R='R --no-save --no-restore-data'
alias ext='cd /Volumes/EXT4TB'
alias ic='cd /Users/brian/Library/Mobile\ Documents/com~apple~CloudDocs'
alias wtf-news='wtfutil --config=/Users/brian/.config/wtf/news.yml'
alias wtf-reddit='wtfutil --config=/Users/brian/.config/wtf/subreddit.yml'
alias .git='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias python='python3'

alias fzb='fzf --preview "bat --style=numbers --color=always {}"'
alias fzn='vim $(fzf --preview="bat --style=numbers --color=always {}")'
alias fznm='vim $(fzf -m --preview="bat --style=numbers --color=always {}")'

# Pomodoro Timer - https://github.com/caarlos0/timer
# brew install caarlos0/tap/timer
# brew install terminal-notifier
alias work="timer 60m --format 24h && say 'Work session over.' \
                && terminal-notifier -message 'Pomodoro'\
        -title 'Start break.'\
        -sound Crystal"

alias rest="timer 10m --format 24h && say 'Break session over.' \
                && terminal-notifier -message 'Pomodoro'\
        -title 'Break over.'\
        -sound Crystal"

# Loop so you don't have to keep typing aliases
pomo(){
        echo "How many rounds you want to do?"
        read count;
        for i in {1..$count};
        do
                work;
                sleep 1;
                rest;
        done
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Zoxide
eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"
