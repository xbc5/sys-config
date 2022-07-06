{{ pillar.paths.profile.functions }}:
  file.managed:
    - source: salt://states/shell/profile/functions/files/functions.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
