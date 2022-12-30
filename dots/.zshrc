bindkey -v

alias rc='nvim $HOME/.zshrc'
alias src='source $HOME/.zshrc'

alias :q 'tmux kill-server'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias ta='tmux a -t'


alias cb='cargo build'
alias cr='cargo run'
alias ct='cargo test'
alias cex='cargo --explain'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
