" SETTINGS.VIMRC

" Determine the base directory of all vim configurations
if !exists('$VIMHOME')
  let $VIMHOME=$HOME.'/.vim'
endif

" Load each configuration file in the config folder
for file in split(globpath($VIMHOME.'/config', '*.vimrc'), '\n')
  execute 'source' file
endfor

