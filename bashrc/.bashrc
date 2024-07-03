# .bashrc
# Prompt
#RBW_PATH=$HOME/.rainbow-bash
#source $RBW_PATH/init.sh
#rbw_load_theme simple
parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ " 
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -z "$PS1" ] && return

# pyenv settings
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=$PATH:/home/jbarnette/.local/bin
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

flake_changes() {
    git diff --name-only $1 | grep ".py" | xargs flake8
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


export EDITOR='vim'
alias git-noverify='git commit -v --no-verify'
alias pip='pip3'
export LD_LIBRARY_PATH=/usr/lib/oracle/19.19/client64/lib
alias grepx='grep -rin'
export ORACLE_INSTANTCLIENT_VERSION=19.19
#export ORACLE_HOME=/usr/lib/oracle/${ORACLE_INSTANTCLIENT_VERSION}/client64/network/admin
export PATH=$PATH:${ORACLE_HOME}/lib
export ORACLE_HOME=/usr/lib/oracle/19.19/client64
export TNS_ADMIN=/usr/lib/oracle/19.19/client64/lib/network/admin
alias bashrc='vim ~/.bashrc'
alias python='python3'
alias source-bashrc='source ~/.bashrc'
alias source-tmux='tmux source-file ~/.tmux.conf'
alias qbrt='cd ~/apps/qbrt'
alias django-admissions='cd ~/apps/django-admissions'
alias cnaqma='cd ~/apps/cnaqma'
alias ivy_cbt='cd ~/apps/ivy_cbt'
alias apps_internal='cd ~/apps/apps_internal'
alias whitepages='cd ~/apps/whitepages'
alias finaid='cd ~/apps/finaid'
alias surgical_tech='cd ~/apps/surgical_tech'
alias account='cd ~/apps/account'
alias va_benefits='cd ~/apps/va_benefits'
alias blogapp='cd ~/apps/blogapp'
alias vim-config="vim ~/.config/nvim/init.vim"
alias runserver="python manage.py runserver_plus --nopin --threaded --cert=/home/jbarnette/apps/webdev-certificates/certs/sp.crt"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
rs() {
     source app.env
     python manage.py runserver_plus 0:8012 --nopin --threaded --cert=/home/jbarnette/apps/webdev-certificates/certs/sp.crt
}
 function workon(){
    pyenv activate "$@" 2> >(grep -v PYTHON_VIRTUALENV_DISABLE_PROMPT)
}
alias v='vim'
alias dm="python manage.py migrate"
alias dmm="python manage.py makemigrations"
alias dmmm="python manage.py makemigrations & python manage.py migrate"
alias csu="python manage.py createsuperuser"
alias showmigrations='python manage.py showmigrations'
alias l='ls'
alias la='ls -la'
alias c='clear'
alias restartpc='sudo shutdown -r now'
alias tmux-prev='tmux attach-session'
alias vimrc='vim .vimrc'
alias psql="sudo -i -u postgres psql"
alias tmux-config="vim ~/.tmux.conf"
alias rmswaps="cd ~/.local/share/vim/swap; rm -rf *"
alias tmuxinator-config="vim ~/.config/tmuxinator/sample.yml"
alias source-tmux="tmux source-file ~/.tmux.conf"
alias qbrt-reset="psql -c 'DROP DATABASE IF EXISTS qbrt;' && psql -c 'CREATE DATABASE qbrt;'"
alias cnaqma-reset="psql -c 'DROP DATABASE IF EXISTS cnaqma;' && psql -c 'CREATE DATABASE cnaqma;'"
alias shell-plus="python manage.py shell_plus"
alias tx='tmuxinator'
alias tx-celery='tx celery'
alias start-celery-worker='celery -A ivy worker -l info'
alias celery-beat='celery -A ivy beat -l info'
alias createsuperuser='python3 manage.py createsuperuser'
alias oceanicdark='base16_oceanicnext'
alias eighties='base16_eighties'
alias killserver='pkill -f runserver'
alias populate='./manage.py < populate.py'
alias home='cd ~./home/jbarnette'
alias postgres-status='sudo systemctl status postgresql-15'
alias postgres-start='sudo systemctl start postgresql-15'
alias env-deactivate='source deactivate'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export BASE16_TMUX_OPTION_ACTIVE=1
export BASE16_TMUX_OPTION_STATUSBAR=1
source ~/.config/base16-shell/profile_helper.sh
#base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
        [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
                source "$BASE16_SHELL/profile_helper.sh"
