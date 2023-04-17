function gpsu
  set --local branch (git branch --show-current)
  git push -u origin $branch
end
