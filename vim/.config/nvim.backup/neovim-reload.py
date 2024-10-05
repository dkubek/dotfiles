#!/usr/bin/env python3
from pathlib import Path
from neovim import attach


def get_all_instances():
    instances = []

    # get the content of /tmp
    tmpdir = Path('/tmp')
    for file in tmpdir.iterdir():
        # check if it contains any nvim sockets
        if file.is_socket() and file.name.startswith('nvim'):
            instances.append(file)

    return instances


def reload(instance):
    # Reload colorschemes

    # connect over the socker
    nvim = attach('socket', path=instance)

    # Use this if you have your colorschemes in vimscript
    # nvim.command('source ~/.config/nvim/colors/flavours.vim')
    # nvim.command('source ~/.config/nvim/colors-airline.vim')

    # Reload the whole nvim configuration (use if configuration is written in
    #                                      lua)
    nvim.command('luafile $MYVIMRC')


def main():
    # search for neovim instances
    instances = get_all_instances()

    # connect to instances and reload them
    for instance in instances:
        reload(instance)


if __name__ == '__main__':
    main()
