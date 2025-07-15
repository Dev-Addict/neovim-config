# Important Commands Cheatsheet

## AI

- (`n|v`, `<C-a>`): Open codecompanion code actions
- (`n|v`, `<leader>a`): Open codecompanion chat

## Tab bar

- (`n`, `<A-,>`): Go to prev tab
- (`n`, `<A-.>`): Go to next tab
- (`n`, `<A-1>`): Go to tab 1
- (`n`, `<A-2>`): Go to tab 2
- (`n`, `<A-3>`): Go to tab 3
- (`n`, `<A-4>`): Go to tab 4
- (`n`, `<A-5>`): Go to tab 5
- (`n`, `<A-6>`): Go to tab 6
- (`n`, `<A-7>`): Go to tab 7
- (`n`, `<A-8>`): Go to tab 8
- (`n`, `<A-9>`): Go to tab 9
- (`n`, `<A-0>`): Go to tab 10
- (`n`, `<A-c>`): Close current tab
- (`n`, `<C-p>`): Enter pick mode

## Comment

- (`n`, `gcc`): Toggles the current line using linewise comment
- (`n`, `gbc`): Toggles the current line using blockwise comment
- (`n`, `[count]gcc`): Toggles the number of line given as a prefix-count using linewise
- (`n`, `[count]gbc`): Toggles the number of line given as a prefix-count using blockwise
- (`n`, `gc[count]{motion}`): (Op-pending) Toggles the region using linewise comment
- (`n`, `gb[count]{motion}`): (Op-pending) Toggles the region using blockwise comment
- (`v`, `gc`): Toggles the region using linewise comment
- (`v`, `gb`): Toggles the region using blockwise comment
- (`n`, `gn`): Generate docs comments for the subject under the cursor

## LSP

- (`n`, `K`): Hover
- (`n`, `gD`): Go to declaration
- (`n`, `gd`): Go to definition
- (`n`, `gi`): Go to implementation
- (`n`, `<C-k>`): Signature help
- (`n`, `<leader>e`): Show diagnostics
- (`n`, `<leader>wa`): Add workspace
- (`n`, `<leader>wr`): Remove workspace
- (`n`, `<leader>wal`): List workspace
- (`n`, `<leader>d`): Go to type definition
- (`n`, `<leader>rn`): Rename
- (`n|v`, `<leader>ca`): Open code actions
- (`n`, `<leader>f`): Format
- (`n`, `[r`): Previous reference
- (`n`, `]r`): Next reference

### Calls Window

- (`n`, `<leader>gi`): Show outgoing calls
- (`n`, `<leader>go`): Show incoming calls

#### Calls Window Commands

- `e`: Edit(open) file
- `s`: Vsplit
- `i`: Split
- `t`: Open in new tab
- `[w`: Shuttle between the layout left and right
- `u`: Toggle or do request
- `<C-c>k`: Close layout

### Finder Window

- (`n`, `gr`): Open finder and context window

#### Finder Window Commands

- `[w`: Shuttle between the layout left and right
- `o`: Toggle expand or open
- `s`: Vsplit
- `i`: Split
- `t`: Open in tabe
- `r`: Open in new tab
- `q`: Quit
- `<C-c>k`: Close finder

### Outline Window

- (`n`, `<leader>o`): Toggle outline window

#### Outline Window Commands

- `o`: Toggle or jump
- `q`: Quit
- `e`: Jump

## TypeScript Special Support

- (`n`, `<leader>to`): Open the quickfix list
- (`n`, `<leader>tc`): Close the quickfix list

## Go Speical Support

- (`n`, `<leader>ge`): Insert `if err != nil {}`

## Markdown Special Support

- (`n`, `<leader>mp`): Open markdown preview
- (`n`, `<leader>mc`): Close markdown preview
- (`n`, `<A-t>`): Insert a new table
- (`n`, `<A-S-t>`): Insert a new table(not surrounded by pipes)
- (`n`, `<S-TAB>`): Previous cell
- (`n`, `<TAB>`): Next cell
- (`n`, `<A-k>`): Insert row up
- (`n`, `<A-j>`): Insert row down
- (`n`, `<A-h>`): Insert column left
- (`n`, `<A-l>`): Insert column right
- (`n`, `<A-d>`): Delete column

## Debug

- (`n`, `<F5>`): Continue
- (`n`, `<F10>`): Step over
- (`n`, `<F11>`): Step into
- (`n`, `<F12>`): Step out
- (`n`, `<leader>b`): Toggle breakpoitn
- (`n`, `<leader>lp`): Set log print message
- (`n`, `<leader>dr`): Open repl
- (`n`, `<leader>dl`): Run last
- (`n`, `<leader>w`): Open DAP ui
- (`n`, `<leader>W`): Close DAP ui

## Media

- (`n`, `<leader>p`): Paste image

## Cursorline

- (`n`, `<A-p>`): Move to previous reference
- (`n`, `<A-n>`): Move to next reference

## Code Window

- (`n`, `<leader>oo`): Toggle minimap
- (`n`, `<leader>of`): Toggle focuse

## Projects

- (`n`, `<leader>fp`): Open workspaces

## Searching & Replacing

- (`n`, `<leader>S`): Toggle Spectre
- (`n`, `<leader>sw`): Search current word
- (`n`, `<leader>sp`): Search on current file

### Telescope

- (`n`, `<leader>ff`): Find files
- (`n`, `<leader>fg`): Live grep
- (`n`, `<leader>fb`): Find buffers
- (`n`, `<leader>fh`): Help tags
