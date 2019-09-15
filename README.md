# Unempl0yed dotfiles

## Setup
My distro of choice is NixOS. I suppose you could make this work on other
distors as well. Just look into ``applications.nix`` and there find listed
all packages I use.

### NixOS
First we need to setup out operating system. Setup your 
``/etc/nixos/configuration.nix`` according to your and your PC's needs and
edit your imports like so.

```
imports = [
  ...
  /home/**_user_home_**/.nix/desktop.nix
  ...
]
```

Edit **user_home** with the name of your home directory. And run:

```
$ cd _path_to_dotfiles_/.dotfiles
$ stow nix
```

This will add nix configuration from this repo to the 

# TODO end

### .Xresources
Path in .Xresources needs to be rewritten
