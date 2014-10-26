#!/bin/bash

function configure_zsh {
    fpath=($HOME/.zsh/completions $fpath)
    autoload -U compinit && compinit
    autoload -U colors && colors
    setopt prompt_subst
    setopt no_case_glob
    export CLICOLOR=1
    export EDITOR=/usr/bin/vim
    HISTFILE=~/.histfile
    HISTSIZE=1000
    SAVEHIST=1000
    setopt appendhistory # don't clobber history files
    bindkey '^R' history-incremental-search-backward

    ZSH_THEME="smyck"
}

function setup_path {
    PATH="$PATH:$HOME/.bin"
    PATH="$PATH:/usr/local/bin"
    PATH="/apollo/env/ruby193/bin:/apollo/env/SDETools/bin:$PATH"

    export PATH
}

function setup_prompt {
    function git_branch() {
        is_git_branch=$(git rev-parse --is-inside-work-tree 2> /dev/null); 
        if [ ! -z $is_git_branch ]; then
            echo " %{$fg[white]%}on %{$fg[red]%}$(git rev-parse --abbrev-ref HEAD)"
        else
            echo ""
        fi
    }

    PS1='%{$fg[green]%}%~$(git_branch) %{$fg[white]%}→ '
}

function setup_aliases {
    if [ -f ~/.zsh_aliases ]; then
        . ~/.zsh_aliases
    fi
}

configure_zsh
setup_path
setup_prompt
setup_aliases
