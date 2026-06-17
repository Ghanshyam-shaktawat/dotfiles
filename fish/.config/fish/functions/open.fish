function open --description 'Open Nautilus in current directory or given path'
    if test (count $argv) -gt 0
        nautilus $argv[1] >/dev/null 2>&1 &
    else
        nautilus . >/dev/null 2>&1 &
    end
end
