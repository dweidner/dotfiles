" plugin/plugin.plug.vim
"
" @file Configuration of the Plugin Manager


" Open the status information in a new tab
let g:plug_window = "tabnew"

" Add shortcuts to commonly used commands
command! PI PlugInstall
command! PS PlugStatus
command! PU PlugUpgrade | PlugUpdate
