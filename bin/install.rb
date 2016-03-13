#!/usr/bin/ruby

#####################################################################
# Installation scripts for setting environment. Run from git repo
# root folder in order for dot file installation to work correctly.
#
# # --help for details
#
#####################################################################

require 'optparse'
require 'fileutils'

DOTFILES = "#{Dir.pwd}/dotfiles"
VIM_CONFIG = "#{Dir.pwd}/vim-config"
FTPLUGIN_CONFIG = "#{Dir.pwd}/ftplugin"
VUNDLE_URL = "https://github.com/gmarik/Vundle.vim.git"

def main()
  options = parse_options()

  if options[:initial_dependencies]
    install_initial_dependencies
  end

  if options[:dotfiles]
    install_dotfiles
  end

  if options[:vim_plugins]
    install_vim_plugins
  end
end

def parse_options() 
  options = {}

  opt_parser = OptionParser.new do |opt|
    opt.banner = "Usage: install.rb [OPTIONS]"

    options[:initial_dependencies] = false
    options[:dotfiles] = false
    options[:vim_plugins] = false
    opt.on('-d', '--dotfiles', 'Symlink dotfiles') { options[:dotfiles] = true }
    opt.on('-i', '--initial_dependencies', 'Install initial dependencies') { options[:initial_dependencies] = true }
    opt.on('-v', '--vim-plugins', 'Install VIM Plugins') { options[:vim_plugins] = true }
    opt.on('-h', '--help', 'Diplay this screen') { puts opt; exit; }
  end

  opt_parser.parse!

  return options
end

def install_initial_dependencies()
  puts "Intalling wget..."
  `brew install wget`

  puts "Installing git..."
  `brew install git`

  puts "Installing python..."
  `brew install python`

  puts "Installing tmux..."
  `brew install tmux`

  # Allows copying within tmux to system clipboard
  puts "Installing tmux addon..."
  `brew install reattach-to-user-namespace`

  puts "Installing VIM..."
  `brew install vim`
end

def install_dotfiles()
  puts "Symlinking dotfiles..."
  Dir.foreach(DOTFILES) do |file|
    if File.file?("#{DOTFILES}/#{file}")
      symlink("#{DOTFILES}/#{file}", "#{Dir.home}/.#{file}")
    end
  end

  # Vim config
  if !File.directory?("#{Dir.home}/.vim")
    Dir.mkdir("#{Dir.home}/.vim")
  end
  symlink(VIM_CONFIG, "#{Dir.home}/.vim/config")
  symlink(FTPLUGIN_CONFIG, "#{Dir.home}/.vim/ftplugin")

  # Persistent undo
  if !File.directory?("#{Dir.home}/.vim/undodir")
    Dir.mkdir("#{Dir.home}/.vim/undodir")
  end

  # Create swapfile directory
  if !File.directory?("#{Dir.home}/.vim/swapfiles")
    Dir.mkdir("#{Dir.home}/.vim/swapfiles")
  end
end

def symlink(source, target) 
  puts "Symlinking #{source} to #{target}"

  if File.symlink?(target)
    File.delete(target)
    puts "... File was already a symlink, deleting"
  end

  if File.exists?(target) 
    backup_loc = "#{target}.bak"
    FileUtils.mv(target, backup_loc)
    puts "... File already exists, backing up to #{backup_loc}"
  end

  File.symlink(source, target)
  puts "... Installed to #{target}"
end

def install_vim_plugins()
  puts "Installing Vundle..."
  `git clone #{VUNDLE_URL} ~/.vim/bundle/vundle`
  `vim +PluginInstall +qall`

  puts "Installing ACK..."
  `brew install ack`

  puts "Installing AG..."
  `brew install ag`
  
  puts "Installing CMake. Dependency of YouCompleteMe..."
  `brew install CMake`

  puts "Installing YouCompleteMe..."
  `~/.vim/bundle/YouCompleteMe/install.sh --clang-completer`

  puts "Installing ctags..."
  `brew install ctags`
end

main
