" plugin/plugin.cycle.vim
"
" @file Configuration of the Cycle plugin


if !dw#IsInstalled('vim-cycle') | finish | endif

" Custom keybindings to trigger and load vim-cycle
let g:cycle_no_mappings = 1

nmap <silent> <Leader>a <Plug>CycleNext
vmap <silent> <Leader>a <Plug>CycleNext
nmap <silent> <Leader>x <Plug>CyclePrev
vmap <silent> <Leader>x <Plug>CyclePrev

" Fallback to the Vim default bindings if no matches are found
noremap <silent> <Plug>CycleFallbackNext <C-A>
noremap <silent> <Plug>CycleFallbackPrev <C-X>


let g:cycle_default_groups = [
      \   [['true', 'false']],
      \   [['yes', 'no']],
      \   [['on', 'off']],
      \   [['0', '1']],
      \   [['+', '-']],
      \   [['"', "'"]],
      \   [['==', '!=']],
      \   [['===', '!==']],
      \   [['and', 'or']],
      \   [['min', 'max']],
      \   [['asc', 'desc']],
      \   [['get', 'set']],
      \   [['add', 'remove']],
      \   [['first', 'last']],
      \   [['before', 'after']],
      \   [['to', 'from']],
      \   [['in', 'out']],
      \   [['up', 'down']],
      \   [['read', 'write']],
      \   [['only', 'except']],
      \   [['without', 'with']],
      \   [['exclude', 'include']],
      \   [['show', 'hide']],
      \   [['odd', 'even']],
      \   [['{:}', '[:]', '(:)'], 'sub_pairs'],
      \   [['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag'], 'hard_case', {'name': 'Tage'}],
      \   [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], 'hard_case', {'name': 'Days'}],
      \   [['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']],
      \ ]

let g:cycle_default_groups_for_html = [
      \   [['h1', 'h2', 'h3', 'h4', 'h5', 'h6'], 'sub_tag', {'name': 'Headings'}],
      \   [['ul', 'ol'], 'sub_tag', {'name': 'Lists'}]
      \]

let g:cycle_default_groups_for_javascript = [
      \   [['var', 'let', 'const']],
      \]

let g:cycle_default_groups_for_php = [
      \   [['private', 'protected', 'public']],
      \]
