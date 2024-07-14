-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Function Definitions
function ExecuteHighlightedInFloatingWindow()
  -- Yank the visually selected text into the default register
  vim.cmd('normal! gv"ay')
  -- Get the yanked text
  local command = vim.fn.getreg('a')
  -- Execute the command and capture the output
  local output = vim.fn.system(command)
  -- Split the output into lines
  local lines = vim.fn.split(output, "\n")
  
  -- Create a new buffer for the floating window
  local buf = vim.api.nvim_create_buf(false, true)
  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  -- Set the file type to JSON for syntax highlighting
  -- vim.api.nvim_buf_set_option(buf, 'filetype', 'json')
  
  -- Get the dimensions of the current Neovim window
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  
  -- Define the size of the floating window
  local float_width = math.floor(width * 0.95)
  local float_height = math.floor(height * 0.95)
  
  -- Define the position of the floating window
  local row = math.floor((height - float_height) / 2)
  local col = math.floor((width - float_width) / 2)
  
  -- Define the options for the floating window
  local opts = {
    style = "minimal",
    relative = "editor",
    width = float_width,
    height = float_height,
    row = row,
    col = col,
    border = "rounded"
  }
  
  -- Create the floating window with the buffer
  vim.api.nvim_open_win(buf, true, opts)
end

function ExecuteCurrentLineInFloatingWindow()
  -- Yank the current line into the default register
  vim.cmd('normal! yy')
  -- Get the yanked text
  local command = vim.fn.getreg('0')
  -- Execute the command and capture the output
  local output = vim.fn.system(command)
  -- Split the output into lines
  local lines = vim.fn.split(output, "\n")
  
  -- Create a new buffer for the floating window
  local buf = vim.api.nvim_create_buf(false, true)
  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  -- Set the file type to JSON for syntax highlighting
  -- vim.api.nvim_buf_set_option(buf, 'filetype', 'json')
  
  -- Get the dimensions of the current Neovim window
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  
  -- Define the size of the floating window
  local float_width = math.floor(width * 0.95)
  local float_height = math.floor(height * 0.95)
  
  -- Define the position of the floating window
  local row = math.floor((height - float_height) / 2)
  local col = math.floor((width - float_width) / 2)
  
  -- Define the options for the floating window
  local opts = {
    style = "minimal",
    relative = "editor",
    width = float_width,
    height = float_height,
    row = row,
    col = col,
    border = "rounded"
  }
  
  -- Create the floating window with the buffer
  vim.api.nvim_open_win(buf, true, opts)
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true -- Print the line number in front of each line
vim.opt.autoindent = true -- Copy indent from current line when starting a new line.
vim.opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
vim.o.ignorecase = true -- Make searches case insensitive
vim.o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains uppercase letters

-- General leader mappings
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- sitch focus back to the previous window
vim.api.nvim_set_keymap('n', '<leader><Tab>', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':vsplit<CR>', { noremap = true, silent = true })
-- Clear search highlight when pressing <Esc>
vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR><Esc>', { noremap = true, silent = true })
-- Map the function to a key (e.g., <Leader>e)
vim.api.nvim_set_keymap('v', '<Leader>e', ':lua ExecuteHighlightedInFloatingWindow()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':lua ExecuteCurrentLineInFloatingWindow()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':set syntax=json<CR>', { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

