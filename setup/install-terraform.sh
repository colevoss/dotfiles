#!/usr/bin/env bash

installTerraform() {
  echo -e "Installing Terraform"

  brew tap hashicorp/tap

  brew install hashicorp/tap/terraform

  echo -e "Terraform installed"
}

installTerraform
