" config/plugin.lengthmatters.vim

" Avoid highlight long lines by default
let g:lengthmatters_on_by_default = 0

" Toggle highlighting of long lines exceeding `textwidth`
nnoremap [ot :LengthmattersEnable<CR>
nnoremap ]ot :LengthmattersDisable<CR>
nnoremap cot :LengthmattersToggle<CR>
