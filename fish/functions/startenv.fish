function startenv --description 'Python venv activation'
    set -gx VIRTUAL_ENV

    if test (count $argv) -eq 0
        set VIRTUAL_ENV $PWD/.venv
    else if string match -q '*/*' $argv
        set VIRTUAL_ENV $argv
    else
        set VIRTUAL_ENV $PWD/$argv
    end

    if not test -d $VIRTUAL_ENV
        echo "Virtual environment does not exist: $VIRTUAL_ENV" >&2
        return 1
    end

    set -l activate_file $VIRTUAL_ENV/bin/activate.fish
    if not test -f $activate_file
        echo "Missing venv activate file: $activate_file" >&2
        return 1
    end
    source "$activate_file"
end
