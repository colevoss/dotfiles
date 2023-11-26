#!/usr/bin/env bash

installGCloud() {
  echo -e "Installing gcloud CLI"

  brew install --cask google-cloud-sdk

  echo -e "gcloud CLI installed"
}

installGCloud
