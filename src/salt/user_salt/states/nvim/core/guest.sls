packer-nvim-installed:
  git.latest:
    - name: https://github.com/wbthomason/packer.nvim.git
    - target: {{ pillar.home }}/.local/share/nvim/site/pack/packer/start/packer.nvim
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

