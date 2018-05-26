# Emacs Setup for python and c/c++


## Prerequisites
1. Cscope
  - Install cscope using the command `sudo apt-get install cscope`
  - I have no idea about `cscope-indexer` file but perform the below tasks anyway to be on the safe side.
  - Make sure to copy the `cscope-indexer` file to `/bin` folder which might be located at `usr/share/doc/cscope/contrib/xcscope` .
  - If you can't find it than download [cscope](https://sourceforge.net/projects/cscope/), extract the files, cd to `cscope/contrib/xcscope` and then cope the file `cscope-indexer` to the `/bin` folder.
  - Also make it executable using the command `sudo chmod 700 cscope-indexer`

2. Elpy
  - Install the dependencies: `pip3 install jedi flake8 autopep8`
  
## Getting Started
Clone this repository to the `.emacs.d` file directory on the home directory. After that you can open and wait for emacs to complete the setup for you. Enjoy !

## Packages Used

- [Company](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#company)
- [Powerline](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#powerline-mode)
- [Elpy](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#elpy)
- [Helm](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#helm)
- [Xscope](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#xscope)
- [Rainbow](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#rainbow)
- [Org](https://github.com/purpleGreap/purplEmacs/blob/master/config.org#org)
