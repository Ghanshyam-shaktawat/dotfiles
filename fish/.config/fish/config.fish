# Environment variables
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx LANG en_US.UTF-8

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

alias pamcan pacman
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'
alias vim nvim
alias vi nvim
alias py python

# pnpm
set -gx PNPM_HOME "/home/ghanshyam/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end

fzf_configure_bindings --directory=\cf --variables=\e\cv

export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/miniconda3/bin/conda
#     eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
# else
#     if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH /opt/miniconda3/bin $PATH
#     end
# end
# <<< conda initialize <<<

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

zoxide init fish | source
