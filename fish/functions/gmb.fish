function gmb
    git stash
    set --local branch (git branch --show-current)
    git checkout beta
    git fetch --all
    git reset --hard origin/beta
    git merge $branch
    if test $status -eq 0
        git push
        git checkout $branch
    end
end
