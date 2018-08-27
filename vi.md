# Setting options
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
# Mapping
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

# How to check loaded scripts, functions and variables
- https://stackoverflow.com/a/48952
  - :scriptnames            : list all plugins, `_vimrcs` loaded (super)  
  - :verbose set history?   : reveals value of history and where set  
  - :function               : list functions  
  - :func SearchCompl       : List particular function

# References
- Learn Vimscript the Hard Way
  - http://learnvimscriptthehardway.stevelosh.com/
- neovim
  - https://neovim.io/
  - Forked from vim 7.?
  - Tries to make vim light weight and well organized in code-wide?
  - Has not yet reached its major release, 1.0 but the contributions and requests are very robust.
