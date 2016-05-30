" autoload functions for autosession

function! autosession#ASSaveSession(sessionfile)
    execute "mksession! " .  a:sessionfile
    echo "Session saved"
endfunctio

function! autosession#ASTryLoadSession(sessionfile)
    if filereadable(expand('./'.a:sessionfile))
        execute "source " .  a:sessionfile
        echo "Session loaded"
    else
        echo "No session found"
    endif
endfunction
