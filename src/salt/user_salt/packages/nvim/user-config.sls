packer-nvim-installed:
  git.latest:
    - name: https://github.com/wbthomason/packer.nvim.git
    - target: {{ pillar.home }}/.local/share/nvim/site/pack/packer/start/packer.nvim
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

nvim-custom-config-cloned:
  git.latest:
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ pillar.home }}/.config/nvim
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

nvim-config-perms-set:
  file.directory:
    - name: {{ pillar.home }}/.config/nvim
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - file_mode: 644
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
