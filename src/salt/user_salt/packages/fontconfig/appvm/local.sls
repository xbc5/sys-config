local-font-dir-created:
  file.directory:
    - name: {{ pillar.paths.fontconfig.local.fonts }}
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

local-font-cache-created:
  file.directory:
    - name: {{ pillar.paths.fontconfig.local.cache }}
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

