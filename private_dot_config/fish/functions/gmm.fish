function gmm
  set branch (git rev-parse --abbrev-ref HEAD)

  if [ $branch = 'main' ]
    git pull origin main
    git remote prune origin
  else
    git checkout main
    git pull origin main
    git remote prune origin
    git checkout $branch
    git merge main
  end
end
