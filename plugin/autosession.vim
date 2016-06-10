" autolayout.vim plugin. autolayout.vim automatically loads the recent layout
" for the current project if it was stored in the .session.vim file

function ASTryLoadSessionIfNoFileSpecified(sessionfile)
    " open session only if specified file is empty
    if @% == ""
        call autosession#ASTryLoadSession(a:sessionfile)
    endif
endfunction

" setup commands and autocommands
command -bar SessionSave call autosession#ASSaveSession('.session.vim')
command -bar SessionLoad call autosession#ASTryLoadSession('.session.vim')
autocmd VimEnter * nested call ASTryLoadSessionIfNoFileSpecified('.session.vim')
