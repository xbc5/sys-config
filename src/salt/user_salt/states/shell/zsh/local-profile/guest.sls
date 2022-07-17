local-zprofile-created:
  file.managed:
    - name: {{ pillar.home }}/.zprofile
    - replace: False
    - mode: 644
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
