" plugin/plugin.jsdoc.vim

let g:jsdoc_enable_es6 = 1            " Allow ES6 shorthand syntax
let g:jsdoc_underscore_private = 1    " Mark underscore functions as private

" Add param type when documenting args
let g:jsdoc_custom_args_regex_only = 1
let g:jsdoc_custom_args_hook = {
  \   '^_\?is': {
  \     'type': '{Boolean}'
  \   },
  \   'date$': {
  \     'type': '{Date}'
  \   },
  \   'el$': {
  \     'type': '{Element}'
  \   },
  \   '\(err\|error\)$': {
  \     'type': '{Error}'
  \   },
  \   '^\(e\|evt\|event\)$': {
  \     'type': '{Event}'
  \   },
  \   '\(callback\|cb\|done\)$': {
  \     'type': '{Function}',
  \     'description': 'Callback function'
  \   },
  \   'handler$': {
  \     'type': '{Function}',
  \     'description': 'Event handler'
  \   },
  \   '^\(on\|handle\)': {
  \     'type': '{Function}',
  \     'description': 'Event handler'
  \   },
  \   'handlers$': {
  \     'type': '{Function[]}',
  \     'description': 'Event handlers'
  \   },
  \   '^\$': {
  \     'type': '{jQuery}'
  \   },
  \   '^i$': {
  \     'type': '{Number}'
  \   },
  \   '\(width\|height\)': {
  \     'type': '{Number}'
  \   },
  \   '\(data\|options\)$': {
  \     'type': '{Object}'
  \   },
  \   'regex': {
  \     'type': '{RegExp}'
  \   },
  \   '\(title\|url\|description\|message\)': {
  \     'type': '{String}'
  \   },
  \   'messages': {
  \     'type': '{String[]}'
  \   },
  \ }

" Custom keybinding to add documentation
nmap <Leader>pd <Plug>(jsdoc)
