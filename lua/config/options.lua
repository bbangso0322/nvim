local opt = vim.opt

opt.formatoptions = "o" -- 주석이 있는 줄에서 o로 새 줄을 만들 때, 주석처리
opt.number = true -- 줄 번호 표시
opt.tabstop = 4 -- tab이 차지하는 칸 수
opt.shiftwidth = 4 -- 들여쓰기 칸 수
opt.expandtab = true -- tab을 공백(띄어쓰기) 로 취급
opt.ignorecase = true -- 검색 시 대소문자 무시
opt.smartcase = true -- 대문자가 있을 때만 대소문자 구별
opt.smartindent = true
opt.shiftround = true -- 들여쓰기를 정수 단위로 반올림함
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.cursorline = true -- 현재 커서가 있는 line highlight
opt.wrap = false -- 화면넘어가는 길 줄에대해 줄바꿈 하지 않음

opt.list = true -- 공백, tab 시각적으로 보이도록함
opt.scrolloff = 4 -- 아래, 위 끝 커서 주변으로 4줄 추가 텍스트를 보여줌
opt.sidescrolloff = 8 -- 좌, 우 8줄 추가로 보여줌
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" } -- 세션에 buffers, .. 등 저장
opt.termguicolors = true -- true color 지원 (다양한 색 지원)
opt.undofile = true -- undo 히스토리를 파일로 저장


