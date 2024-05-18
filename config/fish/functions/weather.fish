function weather --description 'What is the weather?'
    if test (count $argv) -eq 0
        set location (string escape --style=url "pune")
    else
        set location (string escape --style=url "$argv")
    end
    echo "http://wttr.in/$location"
    curl "http://wttr.in/$location"
end
