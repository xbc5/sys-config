git-store-clones-created:
  file.directory:
    - name: {{ pillar.git_clones }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode

git-store-forks-created:
  file.directory:
    - name: {{ pillar.git_forks }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
