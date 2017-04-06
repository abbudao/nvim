# nvim
Personal Neovim configuration.

## Installation

```sh
git clone --recursive --depth=1 https://github.com/rliang/nvim ~/.config/nvim
```

## Updating plugins

```sh
git submodule update --init --recursive --remote
```

## Main keybindings

### Normal/Visual/Operator-pending Mode

* `f` `F` Forward/backward search

### Normal Mode

* `<c-f>` `<c-b>` Next/previous buffer
* `X` Delete buffer
* `Q` Close window
* `gs` Save buffer
* `gS` Save buffer with `SudoWrite`
* `gv` Vertical split
* `gb` Bottom horizontal split
* `gh` Open `CtrlPMRU`
* `ge` Open `Dirvish`
* `<esc>` Open command line window
* `gt` Prompt for `neoterm`
* `ys{motion}` Surround `{motion}`
* `yss` Surround line
* `yS{motion}` Block surround `{motion}`
* `ySs` Block surround line
* `gc{motion}` Comment `{motion}`
* `gcc` Comment line
* `cx{motion}` Exchange `{motion}`
* `cxx` Exchange line
* `[a{motion}` `]a{motion}` Move before/after `{motion}`
* `<c-n>` Start `multiple-cursors`
* `gC` Swap between light/dark theme

### Normal/Visual Mode

* `ga`: Align

### Normal Mode (file explorer)

* `l` `h` Forward/backward navigate
* `~` Home directory
* `q` Exit

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
