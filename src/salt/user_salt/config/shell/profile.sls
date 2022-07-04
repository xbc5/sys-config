{% set files = pillar.paths.profile.keys() %}

{% for f in files %}
{{ pillar.paths.profile_dir }}/{{ f }}.sh:
  file.managed:
    - source: salt://config/shell/files/{{ f }}.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
{% endfor %}
