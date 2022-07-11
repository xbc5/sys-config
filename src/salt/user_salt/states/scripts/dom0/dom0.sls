include:
  - states.scripts.global.admin # easier to use global scripts, instead of local|guest states

{% for t in [ "dom0", "common" ] %}
{{ t }}-scripts-installed-into-dom0:
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
