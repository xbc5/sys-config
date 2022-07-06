git-store-clones-created:
  file.directory:
    - name: {{ pillar.paths.git.clones }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

git-store-forks-created:
  file.directory:
    - name: {{ pillar.paths.git.forks }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
