{% set out = pillar.paths.scripts.init_zinit %}

zinit-init-script-installed:
  file.managed:
    - name: {{ out }}
    - source: salt://packages/zinit/files/init-zinit
    - user: root
    - group: root
    - replace: True
    - mode: 755
