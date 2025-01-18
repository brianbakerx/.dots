local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent == nil and true or opts.silent
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<C-d>', '<C-d>zz', { desc = 'Keep cursor center screen half page down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Keep cursor center screen half page up' })

map('i', 'jk', '<esc>', { desc = "Scroll 'jk' to escape insert mode" })

map('n', '*', '*N', { desc = 'Search under cursor' })
map('v', '*', [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], { desc = 'Search selection' })

map('n', 'H', ':bprevious<cr>', { desc = 'Switch to previous buffer' })
map('n', 'L', ':bnext<cr>', { desc = 'Switch to next buffer' })

map({ 'n', 'v' }, '<leader>y', [["*y]], { desc = 'Copy to clipboard' })
map({ 'n', 'v' }, '<leader>p', [["*p]], { desc = 'Paste from clipboard' })

map('n', '<F9>', ":w <bar> exec '!python3 '.shellescape('%')<CR>", { desc = 'Execute Python script' })

map('n', 'n<CR>', ':tab drop ~/Documents/notes.md<CR>', { desc = 'Create notes.md in new tab if not already open' })

map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set mapping to navigate out of current file
map('n', '-', '<cmd>Oil<CR>')

-- Navigate through quickfix list
map('n', '<A-j>', '<cmd>cnext<CR>')
map('n', '<A-k>', '<cmd>cprev<CR>')

-- setup mapping to call :LazyGit
map('n', '<leader>gg', ':LazyGit<CR>')
