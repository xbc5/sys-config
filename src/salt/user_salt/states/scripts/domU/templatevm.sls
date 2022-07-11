include:
  - states.scripts.global.admin

{% for t in [ "domU", "common" ] %}
{{ t }}-scripts-installed-into-templatevm:
  file.recurse:
    - require:
      - {{ pillar.id.scripts.global.dir_created }}
    - name: {{ pillar.paths.scripts.global }}
    - source: salt://files/scripts/{{ t }}
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755
{% endfor %}
