if status is-interactive
    # Commands to run in interactive sessions can go here
end
rvm default
 
source ~/.asdf/asdf.fish

set uname "$(uname)"

if [ $uname = 'Darwin' ]
  source ~/.iterm2_shell_integration.fish
end
