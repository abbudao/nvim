# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --recursive --depth=1 https://github.com/rliang/nvim ~/.config/nvim
nvim -u NORC +packl +UpdateRemotePlugins +qa
```

## Adding auto-loaded plugins

```sh
git submodule add <repo> pack/<category>/start/<name>
```

## Adding lazily-loaded plugins

```sh
git submodule add <repo> pack/<category>/opt/<name>
```

## Removing plugins

```sh
git submodule deinit pack/<category>/<start|opt>/<name>
git rm pack/<category>/<start|opt>/<name>
```

## Updating plugins

```sh
git submodule update --init --recursive --remote
```
