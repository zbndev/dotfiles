setopt autocd            # Change directory by typing directory name
setopt auto_pushd        # Push directories onto stack
setopt pushd_ignore_dups # Don't push duplicates
setopt pushdminus        # Exchange + and - for pushd/popd

# History
setopt appendhistory        # Append to history file
setopt sharehistory         # Share history between sessions
setopt hist_ignore_space    # Ignore commands starting with space
setopt hist_ignore_all_dups # Remove all duplicates
setopt hist_save_no_dups    # Don't save duplicates
setopt hist_ignore_dups     # Ignore consecutive duplicates
setopt hist_find_no_dups    # Don't show duplicates when searching
setopt hist_reduce_blanks   # Remove superfluous blanks
setopt hist_verify          # Show command before executing from history
setopt inc_append_history   # Add commands immediately

# Completion
setopt complete_in_word # Complete from cursor position
setopt always_to_end    # Move cursor to end after completion
setopt menu_complete    # Auto-select first completion match
setopt list_packed      # Compact completion list

# Correction
setopt correct     # Correct commands
setopt correct_all # Correct all arguments

# Globbing
setopt extended_glob # Extended globbing
setopt glob_dots     # Include dotfiles in globbing
setopt no_case_glob  # Case-insensitive globbing

# Other options
setopt interactivecomments # Allow comments in interactive shell
setopt magicequalsubst     # Enable = expansion
setopt notify              # Report job status immediately
setopt numericglobsort     # Sort filenames numerically
setopt promptsubst         # Enable prompt substitution
setopt no_beep             # Disable beeping
setopt no_flow_control     # Disable flow control (^S/^Q)
