" Zeilennummern anzeigen
set number

" Syntaxhighlighting an
syntax on 

" Text automatisch einrücken
set autoindent

" Tabs als Leerzeichen einfügen
set expandtab

" Anzahl der Leerzeichen für ein Tab
set tabstop=4

" Die optische Weite des Einzugs
set shiftwidth=4

" Highlight die aktuelle Zeile
set cursorline

"colorscheme atom

" GUI Elemente entfernen
if has('gui_running')
        "set guioptions-=m  " Menüleiste
        set guioptions-=T  " Werkzeugleiste
        set guioptions-=r  " Rechte Scrollleiste
        "set guifont=DejaVu\ Sans\ Mono:h13
        colorscheme lucario
endif

" Color theme anhand von Dateiendung
"autocmd BufEnter *.otl colorscheme vo_dark

" Ausgabe Encoding des Terminals
set encoding=utf-8

" Datei Encoding setzen
set fileencoding=utf-8

" XML richtig formatieren
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Markdown Syntax für .md Suffix
au BufRead,BufNewFile *.md set filetype=markdown

" Puppet Syntax für .pp Suffix
au BufRead,BufNewFile *.pp set filetype=puppet

" case-insensitive searching, you can use \C to do a case-sensitive search in vim like /word\C
set ignorecase

" define shortcut  to leader
let mapleader = ","

" write file and execute as python
map <leader>py :w<cr>:!python %<cr>

" write file and execute as php
map <leader>ph :w<cr>:!php %<cr>

" write file and execute as nodejs
map <leader>j :w<cr>:!node %<cr>

" split and create new file
map <leader>n :new<cr>

