set fish_greeting ""
set -gx TERM xterm-256color

# aliases
# no rm
function rm
  echo "Use trash instead of rm"
end
# trash-cli
alias del "trash-put"
alias del-list "trash-list"
alias del-res "trash-restore"
alias del-clean "trash-empty"
alias del-rm "trash-rm"
# git
alias g "git"
alias ga "git add"
alias gc "git commit"
alias gca "git commit --amend"
# ls (exa)
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
# others
alias cat "bat"

# use nvim if it exists
if command -qv nvim
  alias vim nvim
end

# global variables
set -gx EDITOR nvim
set -gx TERMINAL alacritty

# source / path
source /opt/asdf-vm/asdf.fish # asdf
set -gx PNPM_HOME "/home/dtsf/.local/share/pnpm" # pnpm
set -gx PATH bin ~/bin ~/.local/bin ~/.asdf/shims "$PNPM_HOME" $PATH

# plugins config
set -U __done_min_cmd_duration 5000

# commands to run in interactive sessions can go here
if status is-interactive
end

# fzf with fd
set -U FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --color=always"
set -U FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# hydro prompt config
# source ~/.config/fish/conf.d/prompt.fish
set -g hydro_color_prompt blue
set -g hydro_color_pwd blue
set -g hydro_color_git red
set -g hydro_color_error red
set -g hydro_color_duration green

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
