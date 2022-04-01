# Matlab directory
export MATLAB_DIR="/opt/tmw/matlab"

# Matlab log file location
if [ ! -z "${XDG_CACHE_HOME}" ] ; then
    export MATLAB_LOG_DIR="${XDG_CACHE_HOME}/matlab/"
else
    export MATLAB_LOG_DIR="${HOME}/.cache/matlab/"
fi

# Matlab libraries
#export MATLAB_LIBS="/usr/lib/libstdc++.so
#/usr/lib/libfreetype.so.6"
#for lib in $MATLAB_LIBS ; do
#    if [ -f "${lib}" ]; then
#        # Sequentially add to LD_PRELOAD
#        if [ -z "${LD_PRELOAD}" ]; then
#            export LD_PRELOAD="${lib}"
#        else
#            export LD_PRELOAD="${LD_PRELOAD}:${lib}"
#        fi
#    fi
#done

# Tell MATLAB to use mesa driver i965 instead of Iris on intel cards
if [ "$(hostname)" = 'sbp-laptop' ] ; then
  export MATLAB_INTEL_OVERRIDE=yes
fi

# Set matlab Java version
# export MATLAB_JAVA=/usr/lib/jvm/java-8-openjdk/jre
