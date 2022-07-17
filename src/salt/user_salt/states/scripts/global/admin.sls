include:
  - states.shell.profile.env.admin

{# create global scripts dir -#}
{{ pillar.id.scripts.global.dir_created }}:
  file.directory:
    - require:
      {# can't have scripts dir without its path set -#}
      - file: {{ pillar.id.env_profile_created }}
    - name: {{ pillar.paths.scripts.global }}
    - mode: 755
    - user: root
    - group: root
    - replace: False
