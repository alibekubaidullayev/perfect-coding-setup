export ZSH="$HOME/.oh-my-zsh"
export KEYTIMEOUT=1
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

CASE_SENSITIVE=true

source $ZSH/oh-my-zsh.sh
alias ll='ls -al'
alias pip=pip3
alias g++='g++ -std=c++20'
alias clang++='clang++ -std=c++17'
alias zed="open -a /Applications/Zed.app -n"
alias python="python3"
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$(go env GOPATH)/bin:$PATH
export PATH=$PATH:$(go env GOBIN)

export ANDROID_HOME="/Users/alibekubaidullayev/Library/Android/sdk" 
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

eval "$(pyenv init -)"

export LANG=en_US.UTF-8

crun() {
    output="crun.out"
    cc "$@" -o $output && ./$output
}

function fzf_cd() {
    local file
    file=$(fzf --query="$1")
    if [ -n "$file" ]; then
        cd "$(dirname "$file")" || return
    fi
}
alias ff="fzf_cd"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin

alias tmls="tmux ls"
alias tnew="tmux new -s"
alias tks="tmux kill-session -t"
alias tka="tmux kill-server"
alias tmat="tmux attach -t"
alias tdet="tmux detach"
alias tsw="tmux switch -t"
alias tres="tmux source-file ~/.tmux.conf" 

function tms() {
    if ! command -v tmux >/dev/null 2>&1; then
        echo "tmux not found" >&2
        return 1
    fi

    if ! tmux list-sessions >/dev/null 2>&1; then
        echo "no tmux sessions" >&2
        return 1
    fi

    local selection key

    selection=$(
        tmux list-windows -a \
            -F '#S:#I #{?session_attached,●,○}  #S  #I  #{?window_active,★, }  #{window_name}  (#{pane_current_command})' \
        | fzf \
            --prompt="tmux windows > " \
            --ansi \
            --border \
            --height=80% \
            --layout=reverse \
            --with-nth=2.. \
            --header=$'● attached session   ○ detached session   ★ active window' \
            --preview '
                # First field is "<session>:<index>"
                target=$(echo {} | cut -d" " -f1)
                [ -z "$target" ] && exit 0

                session=${target%%:*}
                window=${target#*:}

                # Header
                printf "\033[1;36mSession:\033[0m %s   \033[1;36mWindow:\033[0m %s\n" "$session" "$window"
                printf "\033[90m────────────────────────────────────────────────────────\033[0m\n"

                # Content: last 40 lines of the pane, strip NULs
                if tmux capture-pane -p -S -40 -t "$target" 2>/dev/null | tr "\000" " " | sed "s/[[:space:]]\+$//" | sed -n "1,40p"; then
                    :
                else
                    printf "\033[90m[ no content / pane not available ]\033[0m\n"
                fi
            ' \
            --preview-window=right:60%
    ) || return

    key=${selection%% *}

    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$key"
    else
        tmux attach -t "$key"
    fi
}
alias ta="tms"

. "$HOME/.local/bin/env"

source $HOME/.local/bin/env 

alias vi="nvim"
alias uvnv="source .venv/bin/activate"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

for map in emacs viins vicmd; do
  bindkey -M $map -r '\ec' 2>/dev/null
done

export PATH="/opt/homebrew/opt/python@3.13/bin:$PATH"
