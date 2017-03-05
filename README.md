# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --recursive --depth=1 https://github.com/rliang/nvim ~/.config/nvim
```

## Updating plugins

```sh
git submodule update --init --recursive
```

## Main keybindings

### Normal/Visual/Operator-pending Mode

* `f` `F` Forward/backward search

### Normal Mode

* `<c-f>` `<c-b>` Next/previous buffer

* `X` Delete buffer
* `Q` Close window

* `gs` Save buffer
* `gS` Save buffer with `sudo`

* `gu` Open undo tree

* `gh` Open MRU file list
* `ge` Open file explorer

* `<esc>` Open command line window

* `gt` Open terminal in bottom split
* `gT` Open terminal

* `ys{motion}` Surround `{motion}`
* `yss` Surround line
* `yS{motion}` Block surround `{motion}`
* `ySs` Block surround line
* `gc{motion}` Comment `{motion}`
* `gcc` Comment line
* `cx{motion}` Exchange `{motion}`
* `cxx` Exchange line

* `<c-n>` Multiple cursors

### Normal/Visual Mode

* `ga`: Align
* `gQ`: Format

### Normal Mode (file explorer)

* `l` `h` Forward/backward navigate
* `~` Home directory

### Normal Mode (command-line window)

* `<esc>` Exit command-line window

### Terminal Mode

* `<esc>` Exit terminal mode

### Insert Mode

* `<s-tab>` Jump outside delimiter

* `<tab>` Expand snippet
* `<tab>` `<s-tab>` Forward/backward jump in snippet

### Insert/Command Mode

* `<c-a>` `<c-e>` Beginning/end of line
* `<c-f>` `<c-b>` Forward/backward character
* `<m-f>` `<m-b>` Forward/backward word
* `<m-n>` `<m-p>` Forward/backward history
* `<m-bs>` Delete word

### Operator-pending Mode

* `if{char}` `af{char}` Between `{char}`
* `iv` `av` Underscore/camel case
* `ii` `iI` `ai` `aI` Indentation level
* `ia` `aa` Argument
* `im` `iM` `am` `aM` Method call chain
