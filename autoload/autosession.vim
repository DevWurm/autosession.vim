" autoload functions for autosession

function! autosession#ASSaveSession(sessionfile)
    execute "mksession! " .  a:sessionfile
endfunction
