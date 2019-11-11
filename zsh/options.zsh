# zsh/options.zsh
#
# @file Customizes zsh options.
# -----------------------------------------------------------------------
# Table of Contents
# -----------------------------------------------------------------------
# 1. Input/Output
# 2. Job Control
# 3. Expansion and Globbing
# 4. Changing Directories
# 5. Completion System
# 6. History
# -----------------------------------------------------------------------


# (1) Input/Output ------------------------------------------------------ {{{1

stty -ixon                     # Disable start/stop output control
ttyctl -f                      # Restore terminal settings when exiting abnormal

setopt EMACS                   # Selects keymap `emacs' for any operations
setopt NO_FLOW_CONTROL         # Disable start/stop characters in editor
setopt NO_CLOBBER              # Don’t overwrite files with > and >>
setopt INTERACTIVE_COMMENTS    # Allow use of comments in interactive code


# (2) Job Control ------------------------------------------------------- {{{1

setopt NOTIFY                  # Notify about terminating backround jobs
setopt NO_CHECK_JOBS           # Don’t report jobs when exiting shell
setopt NO_HUP                  # Don’t kill jobs on shell exit


# (3) Expansion and Globbing -------------------------------------------- {{{1

setopt EXTENDED_GLOB           # Enabled extended pattern matching for path expansion
setopt GLOB_DOTS               # Expand filenames starting with a dot
setopt NO_CASE_GLOB            # Make globbing case-insensitive


# (4) Changing Directories ---------------------------------------------- {{{1

setopt AUTO_PUSHD              # Make cd push the old directory onto the stack
setopt PUSHD_TO_HOME           # Have pushd with no arguments act like 'pushd ~'
setopt PUSHD_SILENT            # Do not print the directory stack after pushd/popd
setopt PUSHD_IGNORE_DUPS       # Do not store duplicates in stack
setopt CDABLE_VARS             # Change to a directory saved in a variable


# (5) Completion System ------------------------------------------------- {{{1

setopt COMPLETE_IN_WORD        # Complete from both ends of a word
setopt AUTO_MENU               # Show completion menu on successive tab press
setopt AUTO_LIST               # List choices on ambiguous completion
setopt AUTO_PARAM_SLASH        # Add trailing slash to directories
setopt ALWAYS_TO_END           # Move the cursor to the end of a completed word
setopt NO_MENU_COMPLETE        # List poissibilities on completion


# (6) History ----------------------------------------------------------- {{{1

setopt EXTENDED_HISTORY        # Add timestamp and duration to history
setopt SHARE_HISTORY           # Share command history between sessions
setopt INC_APPEND_HISTORY      # Append commands to the history incrementally
setopt HIST_VERIFY             # Verify commands with history expansion
setopt HIST_IGNORE_DUPS        # Avoid adding duplicate lines to history
setopt HIST_IGNORE_SPACE       # Ignore lines starting with a space
setopt HIST_IGNORE_ALL_DUPS    # Delete old record if new one is a duplicate
setopt HIST_SAVE_NO_DUPS       # Avoid saving duplicates to the history file
setopt HIST_EXPIRE_DUPS_FIRST  # Remove duplicate entries first


# vim:foldmethod=marker:foldlevel=2
