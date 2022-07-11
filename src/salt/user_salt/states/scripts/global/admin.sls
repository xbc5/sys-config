include:
  - states.shell.profile.env.admin

{# create global scripts dir -#}
{{ pillar.id.scripts.global.dir_created }}:
  file.directory:
    - name: {{ pillar.paths.scripts.global }}
    - mode: 755
    - user: root
    - group: root
    - replace: False

global-scripts-path-set:
  file.blockreplace:
    - require:
      - {{ pillar.id.env_profile_created }}
    - name: {{ pillar.paths.profile.env }}
    - source: salt://states/scripts/global/files/env.jinja
    - template: jinja
    - marker_start: "# {{ pillar.block_msg.scripts.global.start }}"
    - marker_end: "# {{ pillar.block_msg.scripts.global.end }}"
    - append_if_not_found: False
    - backup: False  # backups will be sourced by shell if True
