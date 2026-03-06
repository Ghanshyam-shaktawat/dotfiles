# General UNIX
abbr -a -g c clear
abbr -a -g cv 'command -v'
abbr -a -g df 'df -h'
abbr -a -g du 'du -h'
abbr -a -g dud 'du -d 1 -h'
abbr -a -g duf 'du -sh *'
abbr -a -g mkdir 'mkdir -pv'
abbr -a -g mv 'mv -iv'
abbr -a -g zz exit
abbr -a -g rm 'rm -rf'

# Moving around
abbr -a -g .. 'cd ..'
abbr -a -g ... 'cd ../../'
abbr -a -g .... 'cd ../../../'
abbr -a -g - 'cd -'

# date/time
abbr -a -- ds 'date +%Y-%m-%d'
abbr -a -- ts 'date +%Y-%m-%dT%H:%M:%SZ'

# Tree - requires eza
abbr -a -g t2 'exa --tree --level=2'
abbr -a -g t3 'exa --tree --level=3'

# Git
abbr -a -g g git
abbr -a -g ga 'git add'
abbr -a -g gl 'git log'
abbr -a -g gaa 'git add --all'
abbr -a -g gap 'git add --patch'
abbr -a -g gc 'git commit'
abbr -a -g gb 'git branch'
abbr -a -g gba 'git branch --all'
abbr -a -g gcl 'git clone'
abbr -a -g gco 'git checkout'
abbr -a -g gcom 'git checkout master'
abbr -a -g gf 'git fetch'
abbr -a -g gfu 'git fetch upstream'
abbr -a -g gpl 'git pull'
abbr -a -g gps 'git push'
abbr -a -g gpum 'git push -u origin master'
abbr -a -g gpuo 'git push -u origin'
abbr -a -g gra 'git remote add'
abbr -a -g gre 'git reset'
abbr -a -g gs 'git status'
abbr -a -g gd 'git diff'

# NPM
abbr -a -g nb 'npm build'
abbr -a -g ncl 'npm clean'
abbr -a -g nd 'npm run dev'
abbr -a -g ndv 'npm develop'
abbr -a -g ni 'npm install'
abbr -a -g nid 'npm install -D'
abbr -a -g nig 'npm install -g'
abbr -a -g nit 'npm init'
abbr -a -g ns 'npm serve'
abbr -a -g nst 'npm start'
abbr -a -g nt 'npm test'
abbr -a -g nv 'npm --version'
abbr -a -g ntd 'npm run tauri dev'

# Python
abbr -a -g pl 'pip list'

# Arch Pacman
abbr -a -g ps 'sudo pacman -S'
abbr -a -g pr 'sudo pacman -R'

# bun & tauri
abbr -a -g btd 'bun tauri dev'
abbr -a -g btb 'bun tauri build'
abbr -a -g bd 'bun dev'
abbr -a -g bi 'bun i'
