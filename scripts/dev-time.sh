#!/usr/bin/env bash

createVimSession() {
  # tmux splitw -h -l 75% -f nvim .
  tmux splitw -h -l 75% -f -c "#{pane_current_path}"
}

createBashSession() {
  tmux splitw -v -d -l 25% -c "#{pane_current_path}" lazygit
}

startDevTime() {
  createBashSession
  createVimSession
}

startDevTime
