local set = vim.opt -- set options

-- Set terminal gui colors
set.termguicolors = true

-- Show relative line numbers
set.relativenumber = true

-- Expand tab to spaces 
-- Set to 'false' when editing Makefiles
set.expandtab = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.splitbelow = true
set.splitright = true

-- The amount of lines from screen to scroll
set.scrolloff = 8

-- For better navigation through lines
set.wrap = false

-- Highlight empty space in visual block mode
set.virtualedit = "block"

-- Split window to show substitutions
set.inccommand = "split"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true

-- to use mouse for resizing splits
set.mouse = 'a'

-- Don't show the mode, since it's already in the status line
set.showmode = false

-- Save undo history
set.undofile = true

-- Keep signcolumn on by default
set.signcolumn = 'yes'

-- Decrease update time
set.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
set.timeoutlen = 300

-- Configure how new splits should be opened
set.splitright = true
set.splitbelow = true

-- Show which line your cursor is on
set.cursorline = true

-- Show column 80
set.colorcolumn = "80"

-- Preview substitutions live, as you type!
set.inccommand = 'split'

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set the Python 3 interpreter path
vim.g.python3_host_prog = '/usr/local/bin/python3'  -- Change this to your Python 3 path

vim.g.codeium_enabled = false
