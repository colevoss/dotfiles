#!/usr/bin/env bash

installOcaml() {
  echo -e "\n============================="
  echo -e "Installing Ocaml"
  echo -e "=============================\n"

  brew install opam

  echo -e "Now run \`opam init\`"
}

initOcaml() {
  echo -e "\n============================="
  echo -e "Initializing Ocaml"
  echo -e "=============================\n"

  ocaml init
}

installOcamlPlatformTools() {
  echo -e "\n============================="
  echo -e "Installing Ocaml Tools"
  echo -e "=============================\n"

  echo -e "Using opam for installation instead of Platform Installer"

  opam install dune merlin ocaml-lsp-server odoc ocamlformat utop dune-release
}

# installOcaml
# initOcaml
# installOcamlPlatformTools
