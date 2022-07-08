# vim: ft=yaml
include:
  - states.repos.fedora.rawhide.admin

older-neovim-removed:
  pkg.removed:
    - require:
      - rawhide-repo-installed
    - name: neovim

newest-neovim-installed:
  pkg.installed:
    - name: neovim
    - fromrepo: rawhide
