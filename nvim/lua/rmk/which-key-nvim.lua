local wk = require("which-key")

wk.setup({})

wk.register({
    f = {
        name = "Find",
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        e = { "<cmd>Telescope file_browser<cr>", "File Broser" },
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
        R = { "<cmd>Telescope git_files<cr>", "Git Files (repo)" },
        t = { "<cmd>Telescope treesitter<cr>", "Treesitter Symbols" },
        z = { "<cmd>Telescope current_buffer_fuzzy_finder<cr>", "Current Buffer" },
    },
    g = {
		name = "Git",
		b = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
		g = { "<cmd>LazyGit<cr>", "LazyGit" },
		l = { "<cmd>Telescope git_branches<cr>", "Branches (log)" },
		s = { "<cmd>Telescope git_status<cr>", "Status" },
	},
	t = {
		name = "Tabs",
		n = { "<Cmd>tabnew +term<CR>", "New with terminal" },
		o = { "<Cmd>tabonly<CR>", "Close all other" },
		q = { "<Cmd>tabclose<CR>", "Close" },
		l = { "<Cmd>tabnext<CR>", "Next" },
		h = { "<Cmd>tabprevious<CR>", "Previous" },
	},
	z = { "<cmd>nohlsearch<cr>", "Clear Search" },
}, {
        prefix = "<space>",
})

wk.register({
	f = {
		s = { "<cmd>Telescope grep_string<cr>", "Find string under cursor" },
	},
}, {})
