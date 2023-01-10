export ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"

load_dir() {
  local dir="$ZSH_CONFIG_DIR/$1"

  if [ ! -d "$dir" ]; then
    echo "Could not load $dir"
    return 1
  fi

  for file in "$dir"/**/*$1.zsh; do
    # echo "Loading ${file}..."
    source ${file}
  done
}

clean_plugin_dir() {
  echo "Cleaning plugin directory: $ZSH_PLUGIN_DIR"
  rm -rf "$ZSH_PLUGIN_DIR"
}

_source_plugin() {
  local source_plugin_name=$(echo "$plugin" | cut -d "/" -f 2)
  plugin_files_names=(
    "$plugin_path/$source_plugin_name.plugin.zsh"
    "$plugin_path/$source_plugin_name.zsh"
    "$plugin_path/$source_plugin_name.zsh-theme"
    "$plugin_path/$source_plugin_name.sh"
  )

  for i in "${plugin_files_names[@]}"; do
    if [ -e "$i" ]; then
      # echo "Sourcing new plugin $i"
      source "$i"
      break
    fi
  done
}

load_plugin() {
  local plugin="$1"
  # If given an absolute path, just load the plugin
  if [ -f "$plugin" ]; then
    # echo "Sourcing local plugin $plugin"
    source "$plugin"
    return 0
  fi

  local alt_name="$2"

  local plugin_name=$(echo "$plugin" | cut -d "/" -f 2)
  if [ ! -z "$alt_name" ]; then
    plugin_name="$alt_name"
  fi

  local plugin_path="$ZSH_PLUGIN_DIR/$plugin_name"


  # If the plugin has been installed, source it
  if [ -d "$plugin_path" ]; then
    # echo "SOURCING PLUGIN $plugin as $plugin_path"
    _source_plugin

    return 0
  fi

  # Clone repo and install plugin
  local git_url="https://github.com/${plugin}.git"
  # echo "Cloning plugin from $git_url to $plugin_path"

  git clone "$git_url" --depth 1 "$plugin_path" > /dev/null 2>&1

  if [ $? -ne 0 ]; then echo "Failed to clone $plugin_name" && return 1; fi

  _source_plugin
}
