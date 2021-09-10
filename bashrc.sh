parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# python
eval "$(pyenv init -)"

# ruby
eval "$(rbenv init -)"

# bash history
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r"

# coreutils
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# git branch bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
  # if not found in /usr/local/etc, try the brew --prefix location
  [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
    . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias VSCode
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# Custom prompt
export PS1="\W \$(parse_git_branch) \$ "
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
