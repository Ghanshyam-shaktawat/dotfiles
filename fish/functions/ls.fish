function ls --wraps='exa --header --icons'
    exa --header --icons --oneline $argv
end
