" autoload functions for autosession

function! autosession#ASSaveSession(sessionfile)
    execute "mkview " .  a:sessionfile
endfunction
