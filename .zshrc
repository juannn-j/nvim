# Enable completion caching
autoload -Uz compinit
zstyle ':completion:*' use-cache on
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION"

# Antidote plugin manager setup
zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory
fpath=("$HOME/.antidote/functions" $fpath)
autoload -Uz antidote

# Generate static plugin file if needed
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >! ${zsh_plugins}.zsh
fi

# Source the plugin bundle
source ${zsh_plugins}.zsh

# Inicialización de herramientas adicionales solo en sesiones interactivas
if [[ $- == *i* ]]; then
  eval "$(zoxide init zsh)"
  eval "$(starship init zsh)"
  eval "$(atuin init zsh)"
  . "$HOME/.cargo/env"
  # eval "$(fzf --zsh)"  # Descomenta si lo usas
fi

# Aliases
alias ls='eza --icons'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# Path personalizado
export PATH="$HOME/.local/bin:$PATH"

# Historial
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Finalización de comandos
autoload -Uz compinit
compinit

export PATH=$PATH:/opt/rocm-6.4.3/bin
export LD_LIBRARY_PATH=/opt/rocm-6.4.3/lib
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/juann/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/juann/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/juann/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/juann/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export QUARTO_VERSION=1.7.33
