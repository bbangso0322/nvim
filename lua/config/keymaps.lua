local map = vim.api.nvim_set_keymap

-- 상하좌우 ctrl키를 사용하여 window 이동
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap = false })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap = false })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = false })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = false })

--  Alt키를 이용하여 줄바꿈
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- window size 조절
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffer 이동
map("n", "<S-h>", "<cmdkbprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- esc로 search시 highlight 된 부분 clear
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Escape and Clear hlsearch" })

-- <>로 indent를 조절하고 선택영역을 유지
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})
