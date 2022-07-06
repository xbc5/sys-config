{% for name, path in pillar.paths.projects.items() %}
{{ name }}-project-dir-created:
  file.directory:
    - name: {{ path }}
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
{% endfor %}
