{{ pillar.id.env_profile_created }}:
  file.managed:
    - source: salt://{{ tpldir }}/files/env.sh
    - name: {{ pillar.paths.profile.env }}
    - template: jinja
    - user: root
    - group: root
    - replace: True
    - mode: 644
