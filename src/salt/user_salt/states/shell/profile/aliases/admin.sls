{{ pillar.paths.profile.aliases }}:
  file.managed:
    - source: salt://states/shell/profile/aliases/files/aliases.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
