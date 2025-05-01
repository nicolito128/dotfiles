#!/usr/bin/env bash

conf_link="https://raw.githubusercontent.com/nicolito128/dotfiles/refs/heads/main/.distrobox/pkg/home/.tmux.conf"

# Files
conf_file=".tmux.conf"
conf_dir=".tmux"
plugins_dir="$conf_dir/plugins"
# Paths
conf_file_path="$HOME/$conf_file"
conf_dir_path="$HOME/$conf_dir"
plugins_dir_path="$HOME/$plugins_dir"

echo "Creating the config folder..."

mkdir -p "$plugins_dir_path"

echo "Fetching if needed the tmux config file..."

if [ ! -f "$conf_file_path" ]; then 
    wget $conf_link -O "$conf_file_path"
    mv "$conf_file" "$conf_dir_path"
fi

echo "Installing tmux plugins at $plugins_dir_path"

declare -a plugins=(
    [0]="tmux-plugins tpm"
    [1]="tmux-plugins tmux-sensible"
    [2]="tmux-plugins tmux-yank"
)

for plugin in "${plugins[@]}"; do
    IFS=' ' read -ra parts <<< "$plugin"
    repo="${parts[0]}"
    name="${parts[1]}"
    plugin_path="$plugins_dir_path/$name"

    echo "- Checking for $repo/$name (=> $plugin_path)"
    if [ ! -d "$plugin_path" ]; then
        echo "-- Fetching plugin..."
        git clone https://github.com/$repo/$name $plugin_path
    fi
done

echo "Done!"

exit 0
