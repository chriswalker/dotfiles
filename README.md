# dotfiles
Various dotfiles for Kakoune, Fish, Wezterm and others. These files are managed by [chezmoi](https://www.chezmoi.io/).

## Installation on a new machine
1. Install `chezmoi` as per the [installation instructions](https://www.chezmoi.io/install/)
2. Run:

   ```shell
   chezmoi init --apply --verbose https://github.com/chriswalker/dotfiles.git
   ```
   (where `--verbose` is optional)

This will initialise Chezmoi on the new machine, check out this dotfiles repo, and apply the changes (currently all changes are applied to `~/.config/`).

