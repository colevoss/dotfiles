#!/usr/bin/env bash

createVimSession() {
  tmux splitw -h -l 75% -f nvim .
}

createBashSession() {
  tmux splitw -v -d -l 25%
}

startDevTime() {
  createBashSession
  createVimSession
}

startDevTime
