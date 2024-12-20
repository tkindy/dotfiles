function repo
  set repo_name $argv[1]
  set repo_path $PROJECTS_HOME/$repo_name

  if not test -d $repo_path
    echo "Repo missing"

    git clone "git@git.hubteam.com:HubSpot/$repo_name.git" $repo_path
    or git clone "git@git.hubteam.com:HubSpotProtected/$repo_name.git" $repo_path
    or return

    set just_cloned 1
  end

  cd $repo_path

  # Track when I visit each repo
  date +%s >> .visited2

  git fetch

  set branch $argv[2]

  if test -n "$branch"
    git checkout $branch
  end

  if test -n "$just_cloned"
    if test -n "$branch"
      git machete discover
    else
      git machete discover --yes
    end
  end

  if test -f pom.xml
    if test -n "$branch"
       or test -n "$just_cloned"
      echo "Running initial Maven build"
      mvn -T 1.5C clean test-compile -DskipValidation
    end
  end
end
