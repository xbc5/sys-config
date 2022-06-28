# vim: ft=yaml
include:
  - packages.rawhide.install

ensure-older-nvim-removed:
  pkg.removed:
    - name: neovim

ensure-nvim-installed:
  pkg.installed:
    - name: neovim
    - fromrepo: rawhide
