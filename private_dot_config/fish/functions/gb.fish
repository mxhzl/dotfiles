function gb
  set branch (git branch -a | sed -E 's/remotes\/[^\/]*\///g; /(\*|HEAD).*$/d' | sort -u | awk '{$1=$1};1' | fzf --height 25% --reverse --border --header='Branches:')

  if [ $branch != '' ]
    git checkout $branch
  end
end
