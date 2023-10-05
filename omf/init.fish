set -g BULLETTRAIN_PROMPT_ORDER \
status \
time \
dir \
ruby \
git

set -g BULLETTRAIN_TIME_12HR true
set -g BULLETTRAIN_TIME_BG magenta
set -g BULLETTRAIN_TIME_FG black

set -g BULLETTRAIN_DIR_BG green
set -g BULLETTRAIN_DIR_FG black

set -g BULLETTRAIN_RUBY_BG blue
set -g BULLETTRAIN_RUBY_FG black
set -g BULLETTRAIN_RUBY_PREFIX ""

set -g BULLETTRAIN_GIT_BG white
set -g BULLETTRAIN_GIT_FG black

set -g BULLETTRAIN_EXEC_TIME_BG magenta
set -g BULLETTRAIN_EXEC_TIME_FG black
set -g BULLETTRAIN_EXEC_TIME_ELAPSED 60

alias mux="tmuxinator"
alias please="sudo"
alias l="ls -lan"
alias muxout="tmux kill-session"

alias gst="git status"
alias gc="git commit -v"
set -g EDITOR nvim

export EDITOR=nvim
fortune | cowsay -f tux
