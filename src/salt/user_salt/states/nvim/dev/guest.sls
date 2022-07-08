include:
  - states.fs.projects.guest # store repo here
  - states.nvim.core.guest # clone packer

{% set repo = pillar.repos.my.nvim.path %}

nvim-dev-config-cloned:
  git.cloned:
    - require:
      - linux-project-dir-created
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ repo }}
    - user: {{ pillar.user }}
  cmd.run:
    - name: git remote set-url origin {{ pillar.repos.my.nvim.git }}
    - runas: {{ pillar.user }}
    - cwd: {{ repo }}
  file.directory:
    - name: {{ repo }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - recurse:
      - user
      - group

nvim-dev-config-linked:
  file.symlink:
    - require:
      - nvim-dev-config-cloned
    - name: {{ pillar.home }}/.config/nvim
    - target: {{ repo }}
    - force: True
    - makedirs: True
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
