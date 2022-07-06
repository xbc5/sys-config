include:
  - states.fs.projects.guest

{% set out = pillar.repos.my.nvim.path %}

nvim-dev-config-cloned:
  git.cloned:
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ out }}
    - user: {{ pillar.user }}

nvim-dev-remote-changed:
  cmd.run:
    - name: git remote set-url origin {{ pillar.repos.my.nvim.git }}
    - runas: {{ pillar.user }}
    - cwd: {{ out }}

nvim-dev-config-perms-set:
  file.directory:
    - name: {{ out }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
