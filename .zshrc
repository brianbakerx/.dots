export PATH="/Users/brian/Library/Python/3.9/bin:$PATH"
export PATH="/Users/brian/.duckdb/cli/latest":$PATH

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit

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
alias l='eza -l'
alias ll='eza -lAh'
alias lt='eza --long --tree --level=3'
alias lg='eza --long --header --inode --git'
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
alias python="$HOME/.local/share/uv/python/cpython-3.13.7-macos-x86_64-none/bin/python3.13"

alias fzfp='fzf --preview "bat --style=numbers --color=always {}"'
alias fzfn='nvim $(fzf --preview="bat --style=numbers --color=always {}")'
alias fzfnm='nvim $(fzf -m --preview="bat --style=numbers --color=always {}")'

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"

# ~/.zshrc
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"
export PATH="$HOME/bin:$PATH"
