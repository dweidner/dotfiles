" plugin/plugin.gutentags.vim

if !executable('npm')
  finish
endif

" Display function signatures in the completion menu
let g:tern_show_signature_in_pum = 1
