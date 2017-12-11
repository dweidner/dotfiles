" plugin/plugin.lightline.vim
"
" @file Configuration of the statusline


if !dw#IsLoaded('lightline.vim') | finish | endif

" Hide the mode message
set noshowmode

" A list of prefix characters used for a variaty of components
let s:symbols = {
      \   'branch': '⎇',
      \   'cwd': 'ᴄᴡᴅ',
      \   'modified': '+',
      \   'readonly': 'ʀᴏ',
      \   'spinner': '…',
      \   'info': 'ℹ︎',
      \   'ok': '✓',
      \   'error': '✕',
      \   'warning': '△',
      \ }

" Customize the statusline
let g:lightline = {
      \   'colorscheme': 'one',
      \   'active': {
      \     'left': [ ['mode', 'paste'], ['filetype'], ['relativepath', 'modified', 'readonly'] ],
      \     'right': [ ['lineinfo'], [], ['linter', 'fileformat', 'fileencoding', 'branch'] ],
      \   },
      \   'tabline': {
      \     'left': [ ['tabs'] ],
      \     'right': [ [], [], ['cwd'] ],
      \   },
      \   'mode_map': {
      \     'n': ' N ',
      \     'i': ' I ',
      \     'c': ' C ',
      \     'R': ' R ',
      \     's': ' S ',
      \     'S': 'S-L',
      \     '\<C-s>': 'S-B',
      \     't': ' T ',
      \     'v': ' V ',
      \     'V': 'V-L',
      \     '\<C-v>': 'V-B',
      \   },
      \   'component_function': {
      \     'branch': 'LightlineBranch',
      \     'cwd': 'LightlineWorkingDirectory',
      \     'fileencoding': 'LightlineFileEncoding',
      \     'fileformat': 'LightlineFileFormat',
      \     'linter': 'LightlineLinter',
      \     'modified': 'LightlineModified',
      \     'readonly': 'LightlineReadonly',
      \   },
      \   'subseparator': {
      \     'left': '',
      \     'right': '',
      \   },
      \ }

" Get the symbol for a given component
function! s:GetSymbol(name) abort
  return get(s:symbols, a:name)
endfunction

" Display the currently active repository branch using the Fugitive plugin
function! LightlineBranch() abort
  let l:branch = exists('*fugitive#head') ? fugitive#head() : ''
  return l:branch !=# '' ? s:GetSymbol('branch') . ' ' . l:branch : ''
endfunction

" Display the file encoding only if it differs from the expected default (utf-8)
function! LightlineFileEncoding() abort
  let l:encoding = strlen(&fileencoding) ? &fileencoding : &encoding
  return l:encoding !=? 'utf-8' ? l:encoding : ''
endfunction

" Display the file format only if it differs from the expected default (unix)
function! LightlineFileFormat() abort
  return &fileformat !=? 'unix' ? &fileformat : ''
endfunction

" Display the modified flag only for modifiable file types
function! LightlineModified() abort
  return &modifiable && &modified ? s:GetSymbol('modified') : ''
endfunction

" Display the results of the linter
function! LightlineLinter() abort
  let l:winnr = winnr()
  let l:bufnr = winbufnr(l:winnr)

  if exists('*neomake#statusline#get')
    return neomake#statusline#get(l:bufnr, {
          \   'format_running': s:GetSymbol('spinner'),
          \   'format_loclist_ok': '',
          \   'format_loclist_unknown': '',
          \   'format_loclist_type_E': ' ' . s:GetSymbol('error') . ' {{count}}',
          \   'format_loclist_type_W': ' ' . s:GetSymbol('warning') . ' {{count}}',
          \   'format_loclist_type_I': ' ' . s:GetSymbol('info') . ' {{count}}',
          \ })
  endif

  return ''
endfunction

" Display the readonly indicator
function! LightlineReadonly() abort
  if &filetype =~? 'help'
    return ''
  endif

  return &readonly ? s:GetSymbol('readonly') : ''
endfunction

" Display the current working directory
function! LightlineWorkingDirectory() abort
  return s:GetSymbol('cwd') . ' ' . fnamemodify(getcwd(), ':~:.')
endfunction
