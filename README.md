# Nix Configuration

## Install and Setup

### Install nix and nix-configs

```bash
sudo apt install curl git
git clone https://github.com/rkalnins/nix-config.git
curl -L https://nixos.org/nix/install | sh
. /home/rmk/.nix-profile/etc/profile.d/nix.sh
```

### Home Manager

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# simply export for now, take care later to avoid polluting current configs
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install
```

### Setting up nix config

```bash
# add experimental features to ~/.config/nix/nix.conf
mkdir ~/.config/nix && touch ~/.config/nix/nix.conf
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Symlinking `nix-config` and `nixpkgs`

```bash
rm -rf ~/.config/nixpkgs
ln -s ~/nix-config ~/.config/nixpkgs
```

### Finally

```bash
home-manager switch
```
On Ubuntu 16.04, I've had issues building `go` and `cchardet` (a requirement for `black` for `neovim`).

`Go` issues:
- <https://github.com/NixOS/nix/issues/3245>
- <https://github.com/NixOS/nixpkgs/pull/144398>

Workaround here was to `nix build` `go` separately using `--options sandbox false`.

For the `cchardet` issue, I've removed the `black` package from `neovim` for ubuntu 16.04.

Then, if there's a conflict,

```bash
sudo rm /nix/store/<hash>-nix-2.5.1/share/zsh/site-functions/_nix
sudo rm /nix/store/<hash>-home-manager-path/share/zsh/site-functions/_nix

# run switch again
home-manager switch
```

Might have to add `export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH` to somewhere

## Headless VM

### Using new network adapter

From [UChicago instructions](https://howto.cs.uchicago.edu/vm:headless):

1. Create new network using VirtualBox > Tools
2. Add host-only network adapter to VM (Settings > Network), set name to new network created in step 1
3. Setup VM:


```bash
sudo apt update
sudo apt install openssh-server

# check with `nmcli con show` for correct connection first
nmcli con mod "Wired connection 2" ipv4.method "manual" ipv4.addresses "192.168.56.101/24"
```

### Port forwarding

```bash
sudo apt update
sudo apt install openssh-server
sudo apt shutdown -h now
```

Add entry to port forwarding list for VM (Settings > Network > NAT adapter > Advanced > Port forwarding)

```
Host: 127.0.0.1
Host port: xxxx
VM port: 22
```

## Roadmap

- Package these instructins into some kind of deploy script

## Acknowledgements

Thanks to [Jeff Hutchison (jhh)](https://github.com/jhh) for reference with nvim configuration.
