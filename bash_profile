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
    ps wwaux | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:bin/javac::")
export JDK_HOME=$JAVA_HOME
export LANG=en_AU.UTF-8
export BROWSER=chromium
export KARAF_HOME_DEV=~/work/karaf
export JAVA_ARGS="-Xms1500M -Xmx1500M"
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export TZ='Australia/Brisbane'
export BATCH=YES
export M2_HOME=/usr/share/maven
export _JAVA_OPTIONS=-Djdk.net.URLClassPath.disableClassPathURLCheck=true
export TILLER_NAMESPACE=tiller

if [ "$TERM" == "screen-256color" ]; then
    if hash infocmp 2>/dev/null; then
        infocmp screen-256color >/dev/null 2>&1
        if [ $? != 0 ]; then
            TERM=screen
        fi
    fi
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

. "$HOME/.cargo/env"

GNUPGHOME=/home/tomh/.gnupg
