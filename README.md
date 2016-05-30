# autosession.vim
Vim (Neovim) plugin for automatically loading the last session setup in the project.<br>
autosession.vim enables a more fluent behavior of Vim when used in real projects (not just single file editing) by storing the whole session setup of vim (including layout, buffers, configuration, history, etc.) in the current directory, so Vim can be restored exactly as it was when is was opened the last time.<br>
autosession.vim **doesn't store the session by default** (because this would bloat your whole system with session files, everytime you use vim to edit a file somewhere). It just **looks automatically for previous sessions** in the current directory, when Vim is invoked without a file specified. With some [command configurations](#custom-command-setup-commands) you can include the creation and not-creation of session files in your workflow flawlessly.

## Installation
### Plugin repo
```
'DevWurm/autosession.vim'
```
### Plugin manager
Of course you can install autosession.vim with your favourite (Pathogene-compatible [like most of them]) plugin-manager.<br>
With (dein.vim)(https://github.com/Shougo/dein.vim) you add this to your plugin configuration:
```VimL
dein#add('DevWurm/autosession.vim')
```
However you will know best how to install it with your plugin-manager.
### Manually
Clone the Plugin repo
```
git clone https://github.com/DevWurm/autosession.vim.git ./autosession.vim
```
#### Vim
You can install the plugin manually, by copying the `./autosession.vim/plugin/autosession.vim` file in a subdirectory of your plugin directory (typically `~/.vim/bundle/autosession.vim/` or `~/.vim/plugin/autosession.vim/`) and adding this subdirectory to your Vim runtimepath
```VimL
set runtimepath^=~/.vim/<bundle/plugin/...>/autosession.vim
```
After that you have to copy the `./autosession.vim/autoload/autosession.vim` file into the `~/.vim/autoload/` directory.
#### Neovim
In Neovim you can install the plugin manually, by copying the `./autosession.vim/plugin/autosession.vim` file in a subdirectory of your plugin directory (typically `~/.config/nvim/bundle/autosession.vim/` or `~/.config/nvim/plugin/autosession.vim/`) and adding this subdirectory to your Vim runtimepath
```VimL
set runtimepath^=~/.config/nvim/<bundle/plugin/...>/autosession.vim
```
After that you have to copy the `./autosession.vim/autoload/autosession.vim` file into the `~/.config/nvim/autoload/` directory.

## Usage
Using autosession.vim is pretty straightforward. autosession.vim saves the current session in a file called `.session.vim` in the current working directory. When Vim is started in this directory the plugin will recognize this file and reload the session from it.
### Saving the session
autosession.vim doesn't save sessions automatically to prevent the bloating of your system with undesired session setups.<br>
To save the current session in the working directory as `.session.vim` the plugin provides the
```VimL
:SessionSave
```
command.<br>
To remove a project setup, just remove the `.session.vim` file in the directory you want to start vim in.
#### Custom command setup
You can specify some custom commandline commands to include the saving of the session into your workflow. E.g. insert the following lines somewhere into your `.vimrc`/`init.vim` or into a file sourced there to enable the `:Q` (as well as the `:Q!`) command as session-saving equivalent to `:q` (respectively `:q!`) and the `:WQ` (as well as the `WQ!`) command as session-saving equivalent to `:wq` (respecively `:wq!`):
```VimL
" execute the SessionSave command of the autosession.vim plugin and close vim when executing :Q
" and enable the use of ! to force closing even if buffer is not saved
command -bang Q :SessionSave | if <bang>0 | q! | else | q | endif

" execute the SessionSave command of the autosession.vim plugin and write +
" close vim when executing :WQ and enable ! to force write-close
command -bang WQ :SessionSave | if <bang>0 | wq! | else | wq | endif
```
#### Automatically save session when closing vim
Of course you can also configure vim to store the session everytime you close vim (even if I don't recommend it [because of bloating your system]). To do so, just add the following lines into your `.vimrc`/`init.vim` or into a file sourced there:
```VimL
" execute the SessionSave command of the autosession.vim plugin everytime closing vim
autocmd VimLeavePre * SessionSave
```
### Loading the session
Loading the session is pretty easy. If Vim is invoked without a file specified (`vim` and not `vim some.file`) autosession.vim searches a `.session.vim` file in the current directory. If there's one present it restores the session, otherwise it doesn't. Thats it. Nothing else. No rocket science.
#### Loading the session manually
You can load a session from the invokation directory during runtime by calling the following command provided by autosession.vim:
```
:SessionLoad
```
Of course you can bind this command to other commands or keys. To include it perfectly into your workflow.
##Access
You can access the current (developement) source on <a href="https://github.com/DevWurm/autosession.vim/">GitHub</a>. The
current stable version is provided in the latest <a href="https://github.com/DevWurm/autosession.vim/releases">GitHub Release</a>.

##Documentation
There is no documentation yet. (Email me if you have any questions)

##License
'autosession.vim' is offered under MIT License (Read LICENSE). USe it! :)<br>
Copyright 2016 DevWurm

##Collaborating
I really appreciate any kind of collaboration!<br>
You can use the [GitHub issue tracker](https://github.com/DevWurm/autosession.vim/issues) for bugs and feature requests or [create a pull request](https://github.com/DevWurm/autosession.vim//pulls) to submit
changes. Forks are welcome, too!
If you don't want to use these possibilities, you can also write me an email to
<a href='mailto:devwurm@devwurm.net'>devwurm@devwurm.net</a>.

## Contact
If you have any questions, ideas, etc. feel free to contact me:<br>
DevWurm<br>
Email: <a href='mailto:devwurm@devwurm.net'>devwurm@devwurm.net</a><br>
Jabber: devwurm@jabber.ccc.de<br>
Twitter: @DevWurm<br>
