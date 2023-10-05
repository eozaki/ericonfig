source ~/.asdf/asdf.fish
export BUNDLE_GITHUB__COM=c9380e516b037e049473261aa43cbaa229fe4b1d
set PATH /home/linuxbrew/.linuxbrew/bin $PATH

function setgov
  for x in (seq 0 3)
    cpufreq-set -c $x -g $argv
    echo $argv in core $x
  end
end
