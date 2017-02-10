" plugin/plugin.startify.vim

" Customize the default options of startify
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 0
let g:startify_update_oldfiles    = 1
let g:startify_files_number       = 5
let g:startify_session_dir        = g:vim_home . '/tmp/session'

" Customize the header
let g:startify_custom_header = [
  \ '           __',
  \ '   .--.--.|__|.--------.',
  \ '   |  |  ||  ||        |',
  \ '    \___/ |__||__|__|__|',
  \ ''
  \]

" Bookmark frequently edited files
let g:startify_bookmarks = [
  \ { 'v': '~/.vim/vimrc' },
  \ { 'z': '~/.zshrc' },
  \ { 't': '~/.todo' },
  \]
