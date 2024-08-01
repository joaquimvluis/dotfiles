alias stark_aliases="vi ~/dotfiles/zsh/starkdata_aliases.zsh"

# dir shortcuts
alias spf="cd ~/code/starkdataai/spci/spci-frontend"
alias spb="cd ~/code/starkdataai/spci/spci-backend"
alias pfb="cd ~/code/starkdataai/platform/apollo-backend"
alias pff="cd ~/code/starkdataai/platform/apollo-frontend"
alias dgb="cd ~/code/starkdataai/dgpj-app/backend"
alias dgf="cd ~/code/starkdataai/dgpj-app/frontend"

# SPCI
# ----
# Python database module for SPCI project
alias spdb="python3 -m database --command"

# PLATFORM
# --------
# Python database module for Starkdata Platform
pfdb() {
    module=$1
    shift
    for action in "$@"; do
        python -m database.$module\_data -c $action
    done
}

