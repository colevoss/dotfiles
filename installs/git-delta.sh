#!/usr/bin/env bash

installGitDelta() {
  echo -e "\n============================="
  echo -e "Installing Git Delta"
  echo -e "=============================\n"

  brew install git-delta
}

configureGitDelta() {
  echo -e "\n============================="
  echo -e "Configuring Git Delta"
  echo -e "=============================\n"

  git config --global core.pager "delta"
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global delta.light false 
  git config --global merge.conflictStyle "diff3"
  git config --global diff.colorMoved "default"
  git config --global delta.side-by-side true
}

installGitDelta
configureGitDelta
