# My Neovim config files
## to-Do
- [x] Setup an auto pair plugin (autoclose).
- [x] Remove the auto pair plugin (autoclose).
- [x] Make home page better looking (remove banner from Netrw).
- [ ] Install lazygit.
- [x] Install harpoon.
    - [ ] Link harpoon to telescope.
    - [ ] Learn how to remove added pages.
    - [ ] Turn on tabline.
- [x] Install Undotree.
- [x] Setup github repo.
* Fix LSP bindings:
    - [x] workspace symbol.
    - [x] rename workspace symbol.
    - [x] format buffer.
- [ ] ~~support for jupyter notebook files~~
    * No reason to do this really.
    * Either port from notebooks to regular .py files or keep using vscode.
- [x] Refactor init.lua to use multiple files.
 - [x] Create a file for themes.
- [x] Install nvim-comment.
- [x] Bind M-j,M-h, M-k and M-l to navigate on insert mode.
- [x] Install lualine.

## Keymaps
- S-o is the opposite of o.
- S-i enter insert mode on the begining of the line.
- C-space goes to the start of the line ignoring tab spaces
- F is f but backwards.
- D deletes the whole line in front of the cursor.
- _i followed by "{( gets what is inside the characters.
- _a followed by "{( gets what is inside and the characters.
    - example: vi( or ya[ or di"
    - example2: viW selects the continuous text under the cursor.
    - example3: diW delete the continuous text under the cursor.
    - example3.1: ciW delete the continuous text under the cursor.
- r replaces the char under the cursor.

