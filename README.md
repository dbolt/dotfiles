# Install Script
`bin/install.rb --help`

# YouCompleteMe
Plugin [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) will get installed when dotfiles are configured.
It has a compiled component in order to make the fuzzy autocomplete performant. This requires cmake and a newer
python to be installed on the machine. After that you can then install YouCompleteMe.

## Install CMake
1. `unzip ./bin/ycm/cmake-3.1.0-rc1.zip`
2. `cd /bin/ycm/cmake-3.1.0-rc1`
3. `./bootstrap && make && sudo make install`

## Install YouCompleteMe
Follow steps laid out [here](https://github.com/Valloric/YouCompleteMe#full-installation-guide)

Note: If you get errors making the files then you might have to set the variables in the CMakeLists.txt. See [here](http://cpp-dev-talk.blogspot.com/2014/06/using-clang-with.html)
