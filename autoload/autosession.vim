" autoload functions for autosession

function! autosession#ASSaveSession(sessionfile)
    execute "mksession! " .  a:sessionfile
endfunction

function! autosession#ASTryLoadSession(sessionfile)
    if filereadable(expand('./'.a:sessionfile))
       execute "source " .  a:sessionfile
    endif
endfunction
