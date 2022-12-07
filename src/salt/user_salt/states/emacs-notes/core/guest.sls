doom-emacs-user-config-clones:
  git.latest:
    - require:
      - git-store-clones-created
    - name: {{ pillar.repos.my.nvim.https }}
    - target: {{ repo }}
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True
  file.directory:
    - name: {{ pillar.paths.doom_emacs.conf }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

