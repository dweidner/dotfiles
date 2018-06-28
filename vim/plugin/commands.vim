" plugin/localization.vim
"
" @file Custom user commands


" Change the cwd to the current project root
command! -nargs=? Cdr call dw#project#Cd(<f-args>)

" Reveal the given file in Finder application
command! -nargs=? -complete=file Finder call dw#OpenFinder(<f-args>)

" Open the given file in Visual Studio Code
command! -nargs=? -complete=file VSCode call dw#OpenVSCode(<f-args>)

" Fill the current line with the given character
command! -nargs=1 FillLine call dw#FillLine(<f-args>)

" Switch between indentation styles
command! -nargs=1 IndentStyle call dw#IndentStyle(<f-args>)
