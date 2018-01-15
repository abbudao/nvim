# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --recursive --depth=1 https://github.com/abbudao/nvim ~/.config/nvim
nvim '+UpdateRemotePlugins' '+helptags\ ~/.config/nvim' '+qa'
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

## Updating '*Current plugins*' section on README
It is recommended that you create a file called `api_key.env` and put a GitHub API key on it, as unauthenticated requests to GitHub API are limited to 60 per hour. 

On ``.config/nvim/`` simply run:
```
python auto-readme.py
```
:warning: The script is slow

## Current plugins
### Base
#### Start
##### [auto-pairs](https://github.com/jiangmiao/auto-pairs)
Vim plugin, insert or delete brackets, parens, quotes in pair
##### [vim-eunuch](https://github.com/tpope/vim-eunuch)
eunuch.vim: helpers for UNIX
##### [vim-repeat](https://github.com/tpope/vim-repeat)
repeat.vim: enable repeating supported plugin maps with "."
##### [vim-rsi](https://github.com/tpope/vim-rsi)
rsi.vim: Readline style insertion
##### [vim-sleuth](https://github.com/tpope/vim-sleuth)
sleuth.vim: Heuristically set buffer options
### Interface
#### Start
##### [buffertitle.vim](https://github.com/rliang/buffertitle.vim)
Shows a buffer list in the title.
##### [compick.vim](https://github.com/rliang/compick.vim)
A completion-based general-purpose picker for vim
##### [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
one colorscheme pack to rule them all!
##### [vim-mundo](https://github.com/simnalamburt/vim-mundo)
:christmas_tree: Vim undo tree visualizer
### Languages
#### Start
##### [LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim)
Language Server Protocol (LSP) support for vim and neovim.
##### [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
:stars: Dark powered asynchronous completion framework for neovim/Vim8
##### [ultisnips](https://github.com/SirVer/ultisnips)
UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
##### [vim-polyglot](https://github.com/sheerun/vim-polyglot)
A solid language pack for Vim.
##### [vim-snippets](https://github.com/honza/vim-snippets)
vim-snipmate default snippets (Previously snipmate-snippets)
### Objects
#### Start
##### [vim-textobj-between](https://github.com/thinca/vim-textobj-between)
Text objects for a range between a character.
##### [vim-textobj-indent](https://github.com/kana/vim-textobj-indent)
Vim plugin: Text objects for indented blocks of lines
##### [vim-textobj-methodcall](https://github.com/thalesmello/vim-textobj-methodcall)
A Vim text-object for either single or chained method calls.
##### [vim-textobj-parameter](https://github.com/sgur/vim-textobj-parameter)
A fork of textobj-parameter 0.1.0
##### [vim-textobj-user](https://github.com/kana/vim-textobj-user)
Vim plugin: Create your own text objects
##### [vim-textobj-variable-segment](https://github.com/Julian/vim-textobj-variable-segment)
A text object to turn foo_bar_baz into foo_baz *and* quuxSpamEggs into quuxEggs *and* shine your shoes
### Operators
#### Start
##### [operator-camelize.vim](https://github.com/tyru/operator-camelize.vim)
snake_case -> SnakeCase, CamelCase -> camel_case
##### [vim-commentary](https://github.com/tpope/vim-commentary)
commentary.vim: comment stuff out
##### [vim-easy-align](https://github.com/junegunn/vim-easy-align)
:sunflower: A Vim alignment plugin
##### [vim-exchange](https://github.com/tommcdo/vim-exchange)
Easy text exchange operator for Vim
##### [vim-operator-user](https://github.com/kana/vim-operator-user)
Vim plugin: Define your own operator easily
##### [vim-sandwich](https://github.com/machakann/vim-sandwich)
The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
