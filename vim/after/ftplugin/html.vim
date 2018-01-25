" after/ftplugin/html.vim
"
" @file Configuration applied for HTML files


" Do not increase indentation level for html, head and body tags
let g:html_indent_autotags = 'html,head,body'

" Increase the indentation one level within script and style tags
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'

if !dw#IsInstalled('html5.vim')
  let g:html_exclude_tags = ['html', 'head', 'style', 'script' 'body']
endif
