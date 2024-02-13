" plugin/localization.vim
"
" @file Custom user commands


" Reveal the given file in Finder application
command! -nargs=? -complete=file Finder call dw#OpenFinder(<f-args>)

" Open the given file in Visual Studio Code
command! -nargs=? -complete=file VSCode call dw#OpenVSCode(<f-args>)

" Switch between indentation styles
command! -nargs=1 IndentStyle call dw#IndentStyle(<f-args>)
