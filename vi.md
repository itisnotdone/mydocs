# VIM Script
## Setting options
- Toggling boolean options
  - `:set <name>` and `:set no<name>` or `:set <name>!`
- Checking options state
  - `:set <name>?`
- Options with values
  - `:set <name>`
  - `:set <name>=4`
  - `:set <name>?`
- Setting multiple options at once
  - `:set <name1> <name2>=6`
  - Setting options without '=' operation is setting boolean option
## Mapping
- Basic mapping
  - `:map`
  - works in normal mode
  - Special keys such as `<space>` and `<c-d>` can be used
- Modal Mapping
  - *map
  - `:nmap, :vmap, :imap`
  - http://learnvimscriptthehardway.stevelosh.com/chapters/04.html
- Unmapping
  - *unmap
  - `:nunmap, :vunmap, :iunmap`
    - `:numap dd`
- Be careful not to make recursive mapping
- Nonrecursive Mapping
  - *noremap
  - `:noremap, :nnoremap, :vnoremap, :inoremap`
- Use nonrecursive mapping `Always. No, seriously, always.`
- Mapping key sequences using leader
  - to avoid using keys that are being used already
  - put leader which is a prefix key to map key sequences such as ',' and '-'
  
## How to check loaded scripts, functions and variables
- https://stackoverflow.com/a/48952
  - :scriptnames            : list all plugins, `_vimrcs` loaded (super)  
  - :verbose set history?   : reveals value of history and where set  
  - :function               : list functions  
  - :func SearchCompl       : List particular function

## `vipe`
- will let you edit things through pipe
- `echo 'how things are going?' | EDITOR='vim' vipe`
- to let someone edit an existing file and then save the result
  - `cat test.txt | EDITOR='vim' vipe | tee test.txt`
- When `vipe` is executed, it will open $EDITOR with the input entered through the pipe
  
## Redirecting result of VIM command to STDOUT
- `vim -c "redir! > vimout | scriptnames | redir END | q"`
- `vim -c ':set t_ti= t_te= nomore' -c 'scriptnames|q!'`

## ex mode
- `echo '%s/blah/blahblahblah/g | write' | vim -e blah.txt`
- 
```bash
cat test.vim 
%s/blah/blahblahblah/g
write

vim -e blah.txt < test.vim
```

## Things to keep in mind
- Autocommands can be duplicated
  - The problem is that sourcing your ~/.vimrc file rereads the entire file, including any autocommands you've defined! This means that every time you source your ~/.vimrc you'll be duplicating autocommands, which will make Vim run slower because it executes the same commands over and over.

## Else
- Running VIM command on command line
  - `vim -c smile`, `vim -c ':smile'` or `vim +smile`
- Script like execution
  - `vim -c '%s/words_to_change/words_to_be_replaced/g | write | quit' target_file.txt`

## References
- Learn Vimscript the Hard Way
  - http://learnvimscriptthehardway.stevelosh.com/
- Combination of command and object
  - https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
- Cheat Sheet
  - http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
  - https://devhints.io/vim
- neovim
  - https://neovim.io/
  - Forked from vim 7.?
  - Tries to make vim light weight and well organized in code-wide?
  - Has not yet reached its major release, 1.0 but the contributions and requests are very robust.
