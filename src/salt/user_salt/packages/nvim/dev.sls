include:
  - fs.project-dirs

{% set out = pillar.paths.projects.linux + "/nvim" %}

nvim-dev-config-cloned:
  git.latest:
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ out }}
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

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
