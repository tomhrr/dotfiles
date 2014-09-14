SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable.

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
export JDK_HOME=$JAVA_HOME
export LANG=en_AU.utf8
export BROWSER=chromium
export KARAF_HOME_DEV=~/work/karaf
export JAVA_ARGS="-Xms1500M -Xmx1500M"
export PATH=$PATH:/usr/local/maven/bin
export TZ='Australia/Brisbane'

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
