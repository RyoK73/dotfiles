# dotfiles

This _dotfiles_ repository provides the setup for Arch Linux and Mac.

## Overview

![](./image/top-image.png)

### Environment

| heading           | description                                     |
| ----------------- | ----------------------------------------------- |
| OS                | [Omarchy(Arch Linux)](https://omarchy.org), Mac |
| shell             | zsh, bash                                       |
| package manager   | brew, pacman,yay                                |
| dotfiles manager  | GNU Stow                                        |
| terminal emulator | kitty, ghostty                                  |
| editor            | NeoVim, Vim                                     |

### Dotfiles structure

```bash
.
├── LICENSE # MIT
├── README.md
├── doc # Document for understanding command,dotfiles...
├── install-packages.txt # Tools I use
├── common # For both of Linux,Mac setup
│   ├── home # For Based on $HOME files
│   └── root # For Based on root files (ex: /etc/keyd/default.conf)
├── image
│   ├── personal
│   └── top-image.png
├── linux # For Linux setup
│   ├── omarchy-setup.sh
│   ├── home
│   └── root
└── mac # For Mac setup
    ├── mac-setup.sh
    ├── home
    └── root
```

## Installation

### General

1. Download

```bash
git clone https://github.com/RyoK73/dotfiles.git
cd dotfiles
```

### Omarchy

1. Run `./omarchy/omarchy-setup.sh`

### Mac

> Not tested yet, as I don't have a Mac environment currently.

1. Run `./mac/mac-setup.sh`

## Usage for GNU Stow

### Basic concept

GNU Stow symlinks the contents of a package directory into a target directory (`$HOME`).
The directory structure inside a package mirrors the structure it will create under `$HOME`.
Default target directory is `$HOME`(specified by `.stowrc`). So if you don't run it with `-t {target-directory}`, each file will be copied into `$HOME`.

### Usage in case

**Example: Create NeoVim symbolic link**

In my case,this is the file tree on `~/.config/nvim`

```bash
.
├── LICENSE
├── README.md
├── after
│   └── ftplugin
│       └── gitcommit.lua
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── autolist.lua
│       ├── autosave.lua
│       ├── bufferline.lua
│       ├── colorscheme.lua
│       ├── conform.lua
│       ├── example.lua
│       ├── lint.lua
│       ├── lsp.lua
│       ├── nvim-ts-autotag.lua
│       ├── operate.lua
│       ├── render-markdown.lua
│       ├── snacks.lua
│       └── suggestion.lua
└── stylua.toml
```

#### Add new file to dotfiles

Move the existing file (or directory) into the package directory, keeping the same relative path from `$HOME`, then run `stow` to symlink it back.

1. Create directory based on `$HOME`

```bash
cd {your-dotfiles-path}
mkdir -p common/nvim/.config
```

> `mkdir -p {management-directory}/{path-from-$HOME}`

2. Copy existing files

```bash
cp -r ~/.config/nvim ./common/home/nvim/.config/
```

#### Add symbolic link

If the package directory already exists in the repository but hasn't been symlinked yet (e.g. after a fresh `git clone`), just run `stow` for it.

```bash
stow -d ./common/home nvim
```

> `stow -d {parent dirctory of target} {target}`

#### Delete existing symbolic link

Pass `-D` to `stow` to remove the symlinks for a package without deleting the files in the repository.

```bash
stow -D -d ./common/home nvim
```

#### Show list of existing symbolic link

`stow` has no built-in listing command, so use `find` to list symlinks under `$HOME` that point into this repository.

```bash
find ~ -type l -lname '*dotfiles*'
```

## License

MIT
