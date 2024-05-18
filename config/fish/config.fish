#
# MY CUSTOM FISH CONFIG - GSS
#

# Environment variables - https://fishshell.com/docs/current/cmds/set.html
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx DOTFILES "$HOME/dotfiles"
set -gx PROJECTS "$HOME/Projects/"

# Declearing some important aliases for convenience.
alias vim nvim
alias fzf "fzf --preview='less {}'"

# use these to set user paths or run set fish_user_paths from the terminal (fish_add_path/fish_user_paths)
# set fish_user_paths /home/ghan/.nvm/versions/node/v18.19.0/bin

# Press CTRL+ALT+F will open directory search
# fzf_configure_bindings --directory=\cf --variables=\e\cv

# adding conda paths
fish_add_path /home/ghanshyam/miniconda3/condabin

#Setting fd as default file search for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# Starting things with fish
if status is-interactive
    source $XDG_CONFIG_HOME/fish/colors.fish

    ##https://github.com/starship/starship#fish
    starship init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ghanshyam/miniconda3/bin/conda
    eval /home/ghanshyam/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/ghanshyam/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ghanshyam/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/ghanshyam/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
