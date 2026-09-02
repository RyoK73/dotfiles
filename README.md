# dotfiles

This _dotfiles_ repository provides the setup for Arch Linux,Mac

## Overview

![](./image/top-image.png)

| heading           | description                                    |
| ----------------- | ---------------------------------------------- |
| OS                | [Omarchy(Arch Linux)](https://omarchy.org),Mac |
| shell             | zsh,bash                                       |
| package manager   | brew,pacman,yay                                |
| dotfiles manager  | GNU Stow                                       |
| terminal emulator | kitty,ghostty                                  |
| editor            | NeoVim,Vim                                     |

## Installation

### General

1. Download

```bash
git clone https://github.com/RyoK73/dotfiles.git
cd dotfiles
```

### Omarchy

1. Run `./omarchy/omarchy-setup.sh`

This script does

1. Install package written in `./install-packages.txt`

```bash
./omarchy/omarchy-setup.sh
```

### Mac

> No Testing due to I haven't mac enviroment at now.

1. Run `./mac/mac-setup.sh`

```bash
./mac/mac-setup.sh
```

## License

MIT
