# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Example aliases
#alias ll="ls -l"
#alias la="ls -a"
alias ll="exa -l"
alias la="exa -a"
alias lr="exa -TRl"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export GOROOT="/home/tsurai/go"
export GOPATH="/home/tsurai/gocode/"
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

# note functions
raw-name() {
  echo "$*" | cut -d '.' --complement -f2-
}

# Convert a markdown file to manpage format and pipe it to stdout$
mdcat() {
  grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t man | groff -T utf8 -man
}

# Convert a markdown file to manpage and read it with less$
mdless() {
  mdcat "$*" | less
}

# Convert a markdown file to html and view it inside the terminal with w3m$
mdweb() {
  grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t html --webtex=http://chart.apis.google.com/chart\?cht\=tx\&chf\=bg,s,         161616FF\&chco=FFFFFF\&chl\= --toc | w3m -T text/html
}

md-create-pdf() {
  grep -v "\-\-\-\-\-" "$*" | pandoc --toc -o `(raw-name "$*")`.pdf
}

md-create-html-slides() {
  pandoc --self-contained --webtex -t dzslides "$*" -o `(raw-name "$*")`.html
}

md-create-pdf-slides() {
  pandoc -t beamer -V theme:Rochester "$*" -o `(raw-name "$*")`_slides.pdf
}


# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
