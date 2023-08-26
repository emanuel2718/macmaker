bindkey -v

# alias killit='kill $(lsof -t -i:$1)'
alias tmux="TERM=screen-256color tmux"

alias ls="exa"
alias ll="exa --tree --level=2 -a --long --header --accessed"
alias lsh='ls -lah'
alias tk='tmux kill-session -t'
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tc='nvim ~/.tmux.conf'
alias rc='nvim ~/.zshrc'
alias src='source ~/.zshrc'
alias his='nvim ~/.zsh_history'
alias doomsync='~/.emacs.d/bin/doom sync'
alias doomupgrade='~/.emacs.d/bin/doom upgrade'
alias doomdoctor='~/.emacs.d/bin/doom doctor'

alias pns="pnpm nx start"
alias yns="yarn nx start"
alias ynsa="REACT_APP_ENABLE_CUSTOM_AUTH=true yarn nx run schools:start"
alias yts="yarn nx test schools"
alias cts="yarn nx e2e schools-e2e"
alias ctsw="yarn nx e2e schools-e2e --watch"
alias cotsw="pnpm nx e2e coqui-one-e2e --watch"
alias yb="yarn nx affected --base=HEAD~1 --target=build --parallel=3"
alias yt='yarn nx affected --base=HEAD~1 --target=test --parallel=3'
alias yl='yarn nx affected --target=lint'
alias gp="git pull --rebase"
alias python='python3'
alias pip='pip3'
alias vim='nvim'
alias ncc='nvim $HOME/.config/nvim'
alias lg='lazygit'
alias lconf='cd $HOME/.local/share/lunarvim/lvim/lua/lvim && nvim .'


alias ranadev='DEV=true pnpm dev'
alias ranadeploy='rm -rf dist && pnpm run build && netlify deploy --prod --dir dist'
alias turbodeploy='netlify deploy --prod --dir dist'
alias t='tmux-sessionizer'


# ----- RUST -----
alias cb='cargo build'
alias ct='cargo test'
alias cr='cargo run'
alias rex='cargo --explain'
# ----------------

# MacOS specific aliases
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chromef="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-file-access-from-files"
alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# ----- PERSONAL -----
alias wiki="nvim $HOME/developer/personal/notes/wiki.md"
alias nsync="cp -r $HOME/.config/nvim $HOME/developer/personal/macmaker/.config/"

alias vsync="cp ~/Library/Application\ Support/Code/User/keybindings.json $HOME/developer/personal/macmaker/vscode/ && cp ~/Library/Application\ Support/Code/User/settings.json $HOME/developer/personal/macmaker/vscode/"


# alias for hyp fork
alias hyp='node /Users/emanuel/tmp/cli/bin/hyp.js'

# Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


export ZSH="$HOME/.oh-my-zsh"

# PROMPT="%F{green}%n@%m %~ %F{white}$ %F{reset}"
PROMPT="%F{cyan}> %F{green}%1~ %F{white}$ %F{reset}"



#ZSH_THEME="robbyrussell"
#DISABLE_LS_COLORS="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

export VISUAL=nvim
export EDITOR="$VISUAL"


# pnpm
export PNPM_HOME="/Users/emanuel/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH=/Users/emanuel/.local/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Wasmer
export WASMER_DIR="/Users/emanuel/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
