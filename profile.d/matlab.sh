# Matlab directory
export MATLAB_DIR="/opt/tmw/matlab"

# Matlab log file location
if [ ! -z "${XDG_CACHE_HOME}" ] ; then
    export MATLAB_LOG_DIR="${XDG_CACHE_HOME}/matlab/"
else
    export MATLAB_LOG_DIR="${HOME}/.cache/matlab/"
fi

# Tell MATLAB to use zink instead of iris on my laptop
if uname -n | grep --quiet --regexp 'sbp-.*-laptop' 2>/dev/null ; then
    export MATLAB_MESA_OVERRIDE=zink
fi

# Tell matlab where to find the gcc libraries if gcc10 is installed
if [ -x '/usr/bin/gcc-10' ] && [ -d '/usr/lib/gcc/x86_64-pc-linux-gnu' ] ; then
    libdir="$(find '/usr/lib/gcc/x86_64-pc-linux-gnu' \
        -type d -name '10.*' 2>/dev/null \
        | sort | tail -1)" 
    # Export this path if we got a match
    [ -d "${libdir}" ] && export MATLAB_PRELOAD_PATH="${libdir}"
fi

# Set matlab Java version
# export MATLAB_JAVA=/usr/lib/jvm/java-8-openjdk/jre
