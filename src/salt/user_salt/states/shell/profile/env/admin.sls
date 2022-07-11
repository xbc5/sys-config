{{ pillar.id.env_profile_created }}:
  file.managed:
    - source: salt://states/shell/profile/env/files/env.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
