# My dotfiles

## Lunarvim

- install nvim from apt and NOT snap
- install nerdfonts using [getnf](https://github.com/ronniedroid/getnf)

## Bash

- install fzf with git so it can create `.fzf` folder inside `~`, this enables `Ctrl-R` to work with a popup menu

## Pandoc

- use with `docker run --rm -v "$(pwd):/data" -it pandoc/latex --from GFM gfm_file.md -o output_file.pdf`
Note: this only works in english, bulgarian is not supported

## Splitkb Aurora Sweep 34

- generate config with [QMK Configurator](https://config.qmk.fm/#/splitkb/aurora/sweep/rev1/LAYOUT_split_3x5_2)
- compile to `.uf2` file with `qmk compile ~/Downloads/keymap_26_02.json -e CONVERT_TO=elite_pi`
