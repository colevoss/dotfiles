#!/usr/bin/env bash

installTerraform() {
  echo -e "\n============================="
  echo -e "Installing Terraform"
  echo -e "=============================\n"

  brew tap hashicorp/tap

  brew install hashicorp/tap/terraform

  echo -e "Terraform installed"
}

installTerraform
