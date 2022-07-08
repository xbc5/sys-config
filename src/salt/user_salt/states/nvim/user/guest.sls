include:
  - states.git.store.guest # store repo here
  - states.nvim.core.guest # clone packer

{% set repo = pillar.paths.git.clones + "/nvim" %}

nvim-user-config-cloned:
  git.latest:
    - require:
      - git-store-clones-created
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ repo }}
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

set-nvim-user-config-owner-to-{{ pillar.user }}:
  file.directory:
    - name: {{ repo }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - recurse:
      - user
      - group

nvim-user-config-linked:
  file.symlink:
    - name: {{ pillar.home }}/.config/nvim
    - target: {{ repo }}
    - force: True
    - makedirs: True
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
