function clone --description 'git clone simplified'
    # Initialize MY_PROJECTS variable if not set
    set -q MY_PROJECTS; or set MY_PROJECTS $PROJECTS

    if test (count $argv) -eq 0
        echo >&2 "clone: Expecting a repo argument"
        return 1
    end

    # Extract the last part of the repo URL for the destination directory
    set --local giturl $argv[1]
    set --local parts (string split '/' $giturl)
    set --local destrepo $parts[-1]

    # Check if the repo URL has a username, and construct giturl accordingly
    if test (count $parts) -eq 1
        set giturl "git@github.com:Ghanshyam-shaktawat/$giturl"
    else if [ (count $parts) -eq 2 ]
        set giturl "git@github.com:$giturl"
    end

    set --local destdir $MY_PROJECTS/$destrepo
    if not test -d $destdir
        echo "Cloning $giturl to $destdir"
        command git clone --recurse-submodules $giturl $destdir
    else
        echo "No need to clone, that directory already exists."
        echo "Taking you to $destdir."
    end
    cd $destdir
end
