function branch-commits
  git machete log -- --reverse --format='%H' | GIT_PAGER="less -p^commit" xargs git show $argv
end
