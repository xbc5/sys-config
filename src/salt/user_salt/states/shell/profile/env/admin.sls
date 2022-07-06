{{ pillar.paths.profile.env }}:
  file.managed:
    - source: salt://states/shell/profile/env/files/env.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
