# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# set colors
cat .cache/wal/sequences

set -g theme_display_user yes
set -g theme_display_hostname yes

set PATH $PATH ~/scripts
