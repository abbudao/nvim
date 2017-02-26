# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --depth=1 https://github.com/rliang/nvim ~/.config/nvim
```

## Main keybindings

### Normal Mode

* `f` `F` Forward/backward search
* `<c-f>` `<c-b>` Next/previous buffer
* `X` Delete buffer
* `Q` Close window
* `gs` Save buffer

* `<esc>` Open command line window
* `gt` Open terminal in bottom split
* `ge` Open file explorer
* `gh` Open MRU file list
* `gu` Open undo tree

* `ys{motion}` Surround `{motion}`
* `yss` Surround line
* `yS{motion}` Block surround `{motion}`
* `ySs` Block surround line
* `gc{motion}` Comment `{motion}`
* `gcc` Comment line
* `cx{motion}` Exchange `{motion}`
* `cxx` Exchange line

* `<c-n>` Multiple cursors

### Normal Mode (dirvish)

* `l` `h` Forward/backward navigate
* `~` Home directory

### Insert Mode

* `<tab>` Expand snippet
* `<tab>` `<s-tab>` Forward/backward jump in snippet

### Insert/Command Mode

* `<c-a>` `<c-e>` Beginning/end of line
* `<c-f>` `<c-b>` Forward/backward character
* `<m-f>` `<m-b>` Forward/backward word
* `<m-n>` `<m-p>` Forward/backward history
* `<m-bs>` Delete word

### Operator-Pending Mode

* `if{char}` `af{char}` Between `{char}`
* `iv` `av` Underscore/camel case
* `ii` `iI` `ai` `aI` Indentation level
* `ia` `aa` Argument
* `im` `iM` `am` `aM` Method call chain
