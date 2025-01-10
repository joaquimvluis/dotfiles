# Function to check if alias names already exists as other alias or command
check_aliases() {
    for name in "$@"; do
        (type "$name" || alias "$name")
    done

}
# Config files
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimconfig="vim ~/dotfiles/nvim/init.vim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gitconfig="vim ~/.gitconfig"
alias sshconfig="vim ~/.ssh/config"
alias tmuxconfig="vim ~/dotfiles/tmux/tmux.conf"
alias aerospace="vim ~/dotfiles/aerospace/aerospace.toml"
alias hg="history | grep "
alias aliases="vim ~/dotfiles/zsh/aliases.zsh"
alias shortcuts="vim ~/dotfiles/zsh/shortcuts.zsh"
# LAUNCHERS
# Launch yewtube. Change to home because shell might be on project venv
alias yt="cd ~;yt"
# Launch flatpak chromium app
alias chromium="flatpak run org.chromium.Chromium"
# Launch flatpak inkscape app
alias inkscape="flatpak run org.inkscape.Inkscape"
# Start vim-be-good
alias vimbegood="docker run -it --rm brandoncc/vim-be-good:stable"

# PYTHON
# Create virtual environment
alias mkve="python3 -m venv ./venv"
# Activate virtual environment
alias ave="source ./venv/bin/activate"
# Print tree excluding env and pycache files. -A prints ascii identation lines
alias treepy="tree -I '__pycache__|venv' -A"
# Flask aliases
alias fsh="flask shell"
alias fdbg="flask --debug run"
alias fnoauth="DISABLE_TOKEN_AUTH=true flask --debug run"
alias fdb="flask db"
alias fdbu="flask db upgrade"
alias fdbd="flask db downgrade"
alias fdbm="flask db migrate -m"
alias fdbc="flask db current"
alias fdbh="flask db history"
# Highlight flask db history revision
alias fdbhc='flask db history 2>/dev/null | tail -n +13 | grep -C 30 "$(flask db current 2>/dev/null | tail -n 1)"'

# Pytest aliases
alias pyt="pytest"
alias pytv="pytest -v"
alias pytx="pytest -x"
alias pytdw="pytest --disable-warnings"
alias pytntb="pytest --tb=no"
alias pytdwntb="pytest --disable-warnings --tb=no"
# Color python error output
# Color error messages from python, use as "copython test.py" instead of "python test.py"
# WARNING: Takes time to run (small but noticeable)
# May also interfer with print to console (for long running programs) 
norm="$(printf '\033[0m')" #returns to "normal"
bold="$(printf '\033[0;1m')" #set bold
red="$(printf '\033[0;31m')" #set red
boldyellowonblue="$(printf '\033[0;1;33;44m')" 
boldyellow="$(printf '\033[0;1;33m')"
boldred="$(printf '\033[0;1;31m')" #set bold, and set red.

copython() {
        python3 $@ 2>&1 | sed -e "s/Traceback/${boldyellowonblue}&${norm}/g" \
        -e "s/File \".*\.py\".*$/${boldyellow}&${norm}/g" \
        -e "s/\, line [[:digit:]]\+/${boldred}&${norm}/g"
    }

# JAVASCRIPT AND NODE
alias treejs="tree -I 'node_modules'"

# Play white noise
alias noise="mpv --loop ~/Music/noises/brown_pink_white_noise.wav --volume=80"
alias pink="mpv --loop ~/Music/noises/pink_noise.mp3 --volume=80"
alias brown="mpv --loop ~/Music/noises/brown_noise.mp3 --volume=80"
# Create fake camera with blurred background
alias fakecam="~/bin/camera-effects/fakecam.sh"

# docker commands
alias docker-psql="docker run --name local-postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d --rm postgres:latest"
alias docker-psql-reset="docker stop local-postgres && sleep 1 && docker-psql"
# OTHER
# git restore untrack to /tmp/
alias grut="git status -s | grep '^\?\?' | cut -c4- | xargs -p -I {} mv {} /tmp/"
