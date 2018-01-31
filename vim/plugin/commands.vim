" plugin/localization.vim
"
" @file Custom user commands


" Fill the current line with the given character
command! -nargs=1 FillLine call dw#FillLine(<f-args>)

" Switch between indentation styles
command! -nargs=1 IndentStyle call dw#IndentStyle(<f-args>)

" Reveal the given file in Finder application.
command! -nargs=? -complete=file Finder call dw#OpenFinder(<f-args>)
