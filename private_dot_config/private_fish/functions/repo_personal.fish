function repo
  set repo_name $argv[1]
  set repo_path $PROJECTS_HOME/$repo_name

  if not test -d $repo_path
    echo "Repo missing"
    return 1
  end

  cd $repo_path

  # Track when I visit each repo
  date +%s >> .visited2
end
