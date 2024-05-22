local opt = vim.opt

opt.number = true -- 줄 번호 표시
opt.tabstop = 4 -- tab이 차지하는 칸 수
opt.shiftwidth = 4 -- 들여쓰기 칸 수
opt.expandtab = true -- tab을 공백(띄어쓰기) 로 취급
opt.ignorecase = true -- 검색 시 대소문자 무시
opt.smartcase = true -- 대문자가 있을 때만 대소문자 구별
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true