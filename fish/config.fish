if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# opam configuration
source /Users/julien/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

if [ $KITTY_WINDOW_ID ]
    apply_system_mode
end

# pnpm
set -gx PNPM_HOME "/Users/julien/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end