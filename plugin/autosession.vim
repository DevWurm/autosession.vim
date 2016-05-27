" autolayout.vim plugin. autolayout.vim automatically loads the recent layout
" for the current project if it was stored in the .session.vim file

function! ASTryLoadSession(sessionfile)
    if filereadable(expand('./'.a:sessionfile))
       execute "source " .  a:sessionfile
    endif
endfunction

function ASTryLoadSessionIfNoFileSpecified(sessionfile)
    " open session only if specified file is empty
    if @% == ""
        call ASTryLoadSession(a:sessionfile)
    endif
endfunction

" setuo commands and autocommands
command AutosessionSave call autosession#ASSaveSession('.session.vim')
autocmd VimEnter *  call ASTryLoadSessionIfNoFileSpecified('.session.vim')
