function mkenv -d 'Create a python virtual env'
    set -gx VIRTUAL_ENV

    if test (count $argv) -eq 0
        set VIRTUAL_ENV $PWD/.venv
    else
        set VIRTUAL_ENV $PWD/$argv
    end

    if test -d $VIRTUAL_ENV
        echo >&2 "Python venv already exists '$VIRTUAL_ENV'."
        return 1
    end

    python3 -m venv $VIRTUAL_ENV
    set -l ext
    for ext in '' '.fish'
        touch $VIRTUAL_ENV"/envvars"$ext
        echo 'source $VIRTUAL_ENV/envvars'$ext >>"$VIRTUAL_ENV/bin/activate"$ext
    end

    source $VIRTUAL_ENV/bin/activate.fish

end
