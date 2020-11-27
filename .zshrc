# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/halisson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	k
	zsh-autosuggestions
	fzf
	zsh-syntax-highlighting

)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#ALIAS {{{
 	alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
  alias enter_matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
	alias remoto='.config/scripts/rpd-comercial.sh'
  alias packages='pacman -Qe | wc -l'
	alias cpv='rsync -av --progress '
# PACMAN ALIASES {{{
    # we're on ARCH
    if $_isarch; then
      # we're not root
      if ! $_isroot; then
        alias pacman='sudo pacman'
      fi
      alias pacupg='sudo pacman -Syu'            # Synchronize with repositories and then upgrade packages that are out of date on the local system.
      alias pacupd='sudo pacman -Sy'             # Refresh of all package lists after updating /etc/pacman.d/mirrorlist
      alias pacin='sudo pacman -S'               # Install specific package(s) from the repositories
      alias pacinu='sudo pacman -U'              # Install specific local package(s)
      alias pacre='sudo pacman -R'               # Remove the specified package(s), retaining its configuration(s) and required dependencies
      alias pacun='sudo pacman -Rcsn'            # Remove the specified package(s), its configuration(s) and unneeded dependencies
      alias pacinfo='sudo pacman -Si'            # Display information about a given package in the repositories
      alias pacse='sudo pacman -Ss'              # Search for package(s) in the repositories

      alias pacupa='sudo pacman -Sy && sudo abs' # Update and refresh the local package and ABS databases against repositories
      alias pacind='pacman -S --asdeps'          # Install given package(s) as dependencies of another package
      alias pacclean="sudo pacman -Sc"           # Delete all not currently installed package files
      alias pacmake="makepkg -fcsi"              # Make package from PKGBUILD file in current directory
    fi
  #}}}

#alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#!/bin/bash
# pv wrapper that imitates cp usage
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
#   cpv file_or_dir_src file_or_dir_dst
#
# More details at ownyourbits.com

function cpv()
{
  local DST=${@: -1}                    # last element
  local SRC=( ${@: 1 : $# - 1} )        # array with rest of elements

  # checks
  type pv &>/dev/null || { echo "install pv first"; return 1; }
  [ $# -lt 2  ]       && { echo "too few args"    ; return 1; }

  # special invocation
  function cpv_rename()
  {
    local SRC="$1"
    local DST="$2"
    local DSTDIR="$( dirname "$DST" )"

    # checks
    if   [ $# -ne 2     ]; then echo "too few args"          ; return 1; fi
    if ! [ -e "$SRC"    ]; then echo "$SRC doesn't exist"    ; return 1; fi
    if   [ -d "$SRC"    ]; then echo "$SRC is a dir"         ; return 1; fi
    if ! [ -d "$DSTDIR" ]; then echo "$DSTDIR does not exist"; return 1; fi

    # actual copy
    echo -e "\n$SRC 🡺  $DST"
    pv   "$SRC" >"$DST"
  }

  # special case for cpv_rename()
  if ! [ -d "$DST" ]; then cpv_rename "$@"; return $?; fi;

  # more checks
  for src in "${SRC[@]}"; do 
    local dst="$DST/$( basename "$src" )"
    if ! [ -e "$src" ]; then echo "$src doesn't exist" ; return 1;
    elif [ -e "$dst" ]; then echo "$dst already exists"; return 1; fi
  done

  # actual copy
  for src in "${SRC[@]}"; do 
    if ! [ -d "$src" ]; then 
      local dst="$DST/$( basename "$src" )"
      echo -e "\n$src 🡺  $dst"
      pv "$src" > "$dst"
    else 
      local dir="$DST/$( basename "$src" )"
      mkdir "$dir" || continue
      local srcs=( $src/* )
      cpv "${srcs[@]}" "$dir";
    fi
  done
  unset cpv_rename
}

# License
#
# This script is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330,
# Boston, MA  02111-1307  USA
