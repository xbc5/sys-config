# vim: ft=yaml
packer-nvim-installed:
  git.latest:
    - name: https://github.com/wbthomason/packer.nvim.git
    - target: /home/user/.local/share/nvim/site/pack/packer/start/packer.nvim
    - user: user
    - force_clone: True
    - force_checkout: True
    - force_reset: True

nvim-custom-config-cloned:
  git.latest:
    - name: https://github.com/xbc5/nvim.git
    - target: /home/user/.config/nvim
    - user: user
    - force_clone: True
    - force_checkout: True
    - force_reset: True

nvim-config-perms-set:
  file.directory:
    - name: /home/user/.config/nvim
    - user: user
    - group: user
    - file_mode: 644
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
