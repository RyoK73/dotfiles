# FAQ

## What remains after unlinking a symlink with `stow -D`?

- The source files in the stow package directory (e.g. `~/dotfiles/vim/.vimrc`) are **not** deleted — only the symlink in the target directory (e.g. `$HOME`) is removed.
- Empty intermediate directories that stow created are also cleaned up automatically, unless they contain other files not managed by stow.
- Stow only manages symlinks; it never deletes real files, so no data is lost by unlinking.
