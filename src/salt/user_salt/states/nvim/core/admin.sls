# vim: ft=yaml
include:
  - states.repos.fedora.rawhide.admin

ensure-older-nvim-removed:
  pkg.removed:
    - name: neovim

ensure-nvim-installed:
  pkg.installed:
    - name: neovim
    - fromrepo: rawhide
