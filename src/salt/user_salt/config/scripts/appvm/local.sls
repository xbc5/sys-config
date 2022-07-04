{{ pillar.paths.scripts.local }}-created:
  file.directory:
    - name: {{ pillar.paths.scripts.local }}
    - mode: 755
    - user: root
    - group: root
    - replace: False
