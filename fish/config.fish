fish_config theme choose "Dracula Official"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
# alias vim=/home/puppyapple/.local/bin/lvim
alias icat="~/.local/kitty.app/bin/kitty +kitten icat"
alias gpu="watch --color -n1 gpustat --color -cpu"
alias aibaby="ssh jinyan@10.1.100.60"
alias ck="clone-in-kitty"
alias ll="exa -abghl --icons --color-scale"
# Usage: psfind <keywords> (RegExp supported)
function psfind
    ps aux | head -n 1
    ps aux | grep -E $argv[1] | grep -v grep
end

function git_clear
    git remote prune origin
    git checkout master
    git branch -r --format=' %(authorname)/%(refname:short)' --merged | egrep -v "(^\*|master|main|dev)" | awk -F/ '/wuzijun/{print $3"/"$4}' | xargs git push origin --delete
    git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
    return 1
end

function auto_merge
    # set -e
    set branch $(git rev-parse --abbrev-ref HEAD)
    echo "merge $branch to dev and master"
    git checkout dev
    git merge $branch
    git push origin dev
    # git checkout master
    # git merge dev
    # git push origin master
    # return 1
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive &&
  eval /home/puppyapple/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


export DOCKER_BUILDKIT=1
export TERM=xterm-kitty
export PATH="$HOME/.cargo/bin:$PATH"
zoxide init fish | source


# bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
set -Ux LS_COLORS "$(vivid generate one-dark)"
# Created by `pipx` on 2023-02-10 09:04:49
set PATH $PATH /home/puppyapple/.local/bin
