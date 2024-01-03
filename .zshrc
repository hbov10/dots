# Aliases
alias q='exit'
alias ls='lsd -F'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias config='/usr/bin/git --git-dir=/home/hbov/.dotfiles/ --work-tree=/home/hbov'

export LESS='-R --use-color -Dd+r =Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'

export EDITOR='nvim'
export VISUAL='nvim'

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

autoload -Uz compinit
autoload -Uz vcs_info

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' rehash true                      # Rehash so compinit can automatically find new executables in $PATH
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats 'on %F{red} %b%f '    # Set up Git Branch details into prompt

setopt PROMPT_SUBST
PS1='(%F{blue}%t%f) [%F{magenta}%n%f@%F{magenta}%m%f %F{cyan}%~%f]$ '
source ~/.config/user-dirs.dirs

source /usr/share/zsh/plugins/zsh-autosuggestions 
source /usr/share/zsh/plugins/zsh-syntax-highlighting

eval "$(starship init zsh)"

pfetch
