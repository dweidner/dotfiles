" plugin/plugin.indentline.vim
"
" @file Configuration of the IndentLine plugin


if !dw#IsInstalled('indentLine') | finish | endif

let g:indentLine_enabled = 0
let g:indentLine_char = '¦'

nmap [oI :IndentLinesEnable<CR>
nmap ]oI :IndentLinesDisable<CR>
nmap =oI :IndentLinesToggle<CR>
