local opt = vim.opt

opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.wrap = false -- Don't wrap lines
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 4 -- Tab width
opt.shiftwidth = 4 -- Indent width
opt.softtabstop = 4 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.termguicolors = true -- Enable 24-bit colors
opt.signcolumn = "yes" -- Always show sign column
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket
opt.cmdheight = 1 -- Command line height
opt.showmode = false -- Don't show mode in command line
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Floating window transparency
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.concealcursor = "" -- Don't hide cursor line markup
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.ruler = false -- Disable the default ruler
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width

