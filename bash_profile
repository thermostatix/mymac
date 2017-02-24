#!/bin/bash/
#Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PATH="/usr/local/mysql/bin:$PATH"
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# added by Anaconda2 2.5.0 installer
# export PATH="/Users/adriaan/anaconda/bin:$PATH"

# needed to run HealthQ scripts and correctly parse data
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ $(which docker-machine) ]; then
    eval "$(docker-machine env default)"
fi

#just for testing
alias ll='ls -lahG'
alias profServer="kernprof -l src/test/scripts/start_server.py"
alias REM="rm -rfv"
alias Activate="DIR=$`pwd -P`; while [ ! -d "venv" ]; do cd ..; done; source ./venv/bin/activate; echo $DIR; cd $DIR; which python"
alias Run="./run.py"
alias Runp="./runp.py"
alias AllBranches="git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done"
alias Restart=". ~/.bash_profile"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias vis="echo #!/bin/bash\n >> $1; vim $1"
alias retry=". ~/retry.sh"
if [ $1 = "dev" ]; then
    alias setup="virtualenv venv && . venv/bin/activate && pip install -r dev_requirements.txt"
else
    alias setup="virtualenv venv && . venv/bin/activate && pip install -r requirements.txt"
fi

#alias release="virtualenv venv && . venv/bin/activate && pip install --upgrade git+ssh://git@bitbucket.org/HealthQ/$1.git@$2"
clear
#alias release="echo --upgrade git+ssh://git@bitbucket.org/HealthQ/$1.git@$2"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
