# /etc/profile: login shell setup
# vim:ft=sh

# That this file is used by any Bourne-shell derivative to setup the
# environment for login shells.

# Load environment settings from profile.env, which is created by
# env-update from the files in /etc/env.d
if [ -e /etc/profile.env ] ; then
	. /etc/profile.env
fi

# Set our umask
# 077 would be more secure, but 022 is generally quite realistic
umask 022

# Append our default paths
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/sbin'
append_path '/usr/bin'
append_path '/sbin'
append_path '/bin'

# Load sh files from /etc/profile.d
if test -d /etc/profile.d/; then
	for sh in /etc/profile.d/*.sh; do
		test -r "$sh" && . "$sh"
	done
	unset sh
fi

# Remove the function
unset append_path

# Make sure our PATH is exported
export PATH

# Source global bash config; bash.bashrc if present, bash/bashrc if that exists
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
elif [ -n "${BASH_VERSION-}" ] ; then
	# Newer bash ebuilds include /etc/bash/bashrc which will setup PS1
	# including color.  We leave out color here because not all
	# terminals support it.
	if [ -f /etc/bash/bashrc ] ; then
		# Bash login shells run only /etc/profile
		# Bash non-login shells run only /etc/bash/bashrc
		# Since we want to run /etc/bash/bashrc regardless, we source it 
		# from here.  It is unfortunate that there is no way to do 
		# this *after* the user's .bash_profile runs (without putting 
		# it in the user's dot-files), but it shouldn't make any 
		# difference.
		. /etc/bash/bashrc
	else
		PS1='\u@\h \w \$ '
	fi
else
	# Setup a bland default prompt.  Since this prompt should be useable
	# on color and non-color terminals, as well as shells that don't
	# understand sequences such as \h, don't put anything special in it.
	PS1="${USER:-$(whoami 2>/dev/null)}@$(uname -n 2>/dev/null) \$ "
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
