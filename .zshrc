export PATH="/Users/brian/Library/Python/3.9/bin:$PATH"
export PATH="/Users/brian/.duckdb/cli/latest":$PATH

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"
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

# Shortcuts
alias l='eza -l'
alias ll='eza -lAh'
alias lt='eza --long --tree --level=3'
alias lg='eza --long --header --inode --git'

# Navigation aliases
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'

# ZSH config
alias zreload='source ~/.zshrc'
alias zedit='nvim ~/.zshrc'
alias kedit="nvim ~/.config/kitty/kitty.conf"
alias vedit="vi ~/.vimrc"

# Python workflow aliases
alias py="python3"
alias pipi="python3 -m pip"
alias uvpy="uv run python"

pywhere() {
    echo "python:  $(command -v python 2>/dev/null)"
    echo "python3: $(command -v python3 2>/dev/null)"
    echo "pip:     $(command -v pip 2>/dev/null)"
    echo "pipx:    $(command -v pipx 2>/dev/null)"
    echo "uv:      $(command -v uv 2>/dev/null)"
}

# R shortcut for clean execution
alias R='R --no-save --no-restore-data'

#Directory shortcuts
alias ext='cd /Volumes/EXT4TB'
alias ic='cd /Users/brian/Library/Mobile\ Documents/com~apple~CloudDocs'

#WTF shortcuts
alias wtf-news='wtfutil --config=/Users/brian/.config/wtf/news.yml'
alias wtf-reddit='wtfutil --config=/Users/brian/.config/wtf/subreddit.yml'

#Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --decorate --graph --all -10'
alias gpl='git pull'
alias .git='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

#Workspace shortcuts
alias cdt='cd ~/tools'
alias cdws='cd ~/workspace'
alias cdwst='cd ~/workspace/tutorials'
alias cdwsp='cd ~/workspace/projects'

# Workspace metadata helpers

# fuzzy open one file
fzo() {
    local file

    file=$(fd --type f . . \
        | fzf \
          --preview 'bat --style=full --color=always {}')

    [[ -z "$file" ]] && return

    nvim "$file"
}

# fuzzy open multiple files in nvim
fzn() {
    local -a files

    files=("${(@f)$(fd --type f . . \
        | fzf -m \
          --preview 'bat --style=full --color=always {}')}")

    [[ ${#files[@]} -eq 0 ]] && return

    nvim "${files[@]}"
}

# workspace metadata multi-open
wsmn() {
    local files
    files=$(fd meta.yaml ~/workspace \
        | fzf -m \
          --preview 'yq {} | bat --language=yaml --style=full --color=always')

    [[ -z "$files" ]] && return

    echo "$files" | xargs nvim
}

# workspace metadata search
wsms() {
    if [[ -z "$1" ]]; then
        echo "Usage: wsms <search-term>"
        return 1
    fi

    local files
    files=$(rg -l "$1" ~/workspace/**/meta.yaml \
        | fzf -m \
          --preview 'yq {} | bat --language=yaml --style=full --color=always')

    [[ -z "$files" ]] && return

    echo "$files" | xargs nvim
}

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
eval "$(zoxide init zsh)"
