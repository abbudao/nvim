# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --recursive --depth=1 https://github.com/rliang/nvim ~/.config/nvim
nvim +UpdateRemotePlugins +q
```

## Adding plugins

```sh
git submodule add <repo> pack/<category>/start/<name>
```

## Removing plugins

```sh
git submodule deinit pack/<category>/start/<name>
git rm pack/<category>/start/<name>
```

## Updating plugins

```sh
git submodule update --init --recursive --remote
```
