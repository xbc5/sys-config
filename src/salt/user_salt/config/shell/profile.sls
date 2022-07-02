{% set files = ["aliases", "functions", "env"] %}

{% for f in files %}
/etc/profile.d/{{ f }}.sh:
  file.managed:
    - source: salt://config/shell/files/{{ f }}.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
{% endfor %}
