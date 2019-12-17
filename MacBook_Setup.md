# MacBook Setup

# Dotfiles

Clone dotfiles repo

```bash
git clone git@github.com:colevoss/dotfiles.git $HOME/dotfiles
```

# Homebrew

Install Homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

If dotfiles have been cloned, `cd` to that directory and run `brew bundle`

# ZSH

## Install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Configure

Create symbolic link for .zshrc

```bash
ln -s ~/dotfiles/zshrc $HOME/.zshrc
```

`$DOTFILES` cannot be used here yet because that is set in the .zshrc and isn't set until this step is completed

## zsh-syntax-highlighting

Install `zsh-syntax-highlighting`

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Activate plugin in `zshrc` if not already

```bash
plugins=( [plugins...] zsh-syntax-highlighting)
```

## zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Activate plugin in zshrc if not already

```bash
plugins=( [plugins...] zsh-autosuggestions)
```

# Dracula theme

Clone repo

```bash
git clone https://github.com/dracula/zsh.git $HOME/.theme/zsh
```

Link theme to zsh themes

```bash
ln -s $HOME/.themes/zsh/dracula.zsh-theme $ZSH_CUSTOM/themes/dracula.zsh-theme
```

# Apps

## Boom 2

- Install from the app store
- Open top sidebar item to be directed to website to download EQ app
- Download EQ App
- Run installer
  - Allow installer to complete in system preferences → security preferences

# Themes

- Create themes directory in \$HOME
  - `mkdir ~/.themes`

# iTerm

Clone dracula theme

```bash
git clone https://github.com/dracula/iterm.git $HOME/.themes/iterm
```

### Activate theme in iTerm

- Open iTerm preferences
- Profiles → Colors Tab
- Open the Color Presets... drop-down in the bottom right corner
- Select import... from the list
- Navigate to `~/.themes/iterm/Dracula.itermcolors`
- Select `Dracula` theme from Color Presets... list

### Other Theme options

- Set Window → Transparency to about 10% transparent
- Set Font to `Dank Mono` in Text → Font.
  - Dank Mono → Regular → 12

# NVM

## Install

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
```

The export path should be appended to the `.zshrc`

# Docker

# Git

## Setup with personal github account:

[https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

    $ ssh-keygen -t rsa 4096 -C "EMAIL"
    > Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
    // Might want to put a different file
    > Enter passphrase (empty for no passphrase): [Type a passphrase] // Probably dont enter password. Just press Enter
    > Enter same passphrase again: [Type passphrase again]

    $ eval "$(ssh-agent -s)"
    > Agent pid ######

If using a different file, for example if work bitbucket and personal github create the `~/.ssh/config` file like so

    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa // or file for github file

    ssh-add -K ~/.ssh/id_rsa // or specific file

Then add ssh key to github or whatever [https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

    $ pbcopy < ~/.ssh/id_rsa.pub // or other file

SSH key will be in the clipboard

Then add the key to your github or other source control thingy

Adding multiple accounts and ssh keys for different accounts:

[https://www.freecodecamp.org/news/manage-multiple-github-accounts-the-ssh-way-2dadc30ccaca/](https://www.freecodecamp.org/news/manage-multiple-github-accounts-the-ssh-way-2dadc30ccaca/)

# Other

## Font

### Dank Mono

- Navigate to [dank.sh](dank.sh)
- Sign In
- Navigate to dank.sh/releases
- Download most recent release
- Open both `otf` files in the `otf` directory and install fonts

# VSCode

- Install VSCode // might be done in `brew bundle`
- Clone dotfiles
- `chmod` `[vscode-install-plugins.sh](http://vscode-install.sh)` file so it can be ran as an executable
  - `$ chmod +x vscode-install-plugins.sh`
- Run vscode-install script
  - `$ $HOME/dotfiles/vscode-install-plugins.sh`
- Copy `vscode-settings.json` contents from dotfiles into VSCode's settings.json
  - In VSCode
    - Shift + Cmd + P
    - `Preferences: Open Settings (JSON)`
    - Paste contents into opened file and save
    - Probably restart vscode
- Fix Key Repeat for VSCode vim

  \$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Starship

Copy `dotfiles/starship.tom` to `$HOME/.config/starship.toml`

```bash
cp dotfiles/starship.toml $HOME/.config/starship.toml
```

**OR**

Create symbolic to starship file

```bash
$ mkdir $HOME/.config # make config directory if necessary
$ ln -s $DOTFILES/starship.toml $HOME/.config/starship.toml
```
