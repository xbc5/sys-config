include:
  - states.shell.profile.env.admin

{{ pillar.paths.scripts.global }}-created:
  file.directory:
    - name: {{ pillar.paths.scripts.global }}
    - mode: 755
    - user: root
    - group: root
    - replace: False

global-scripts-path-set:
  file.blockreplace:
    - name: {{ pillar.paths.profile.env }}
    - source: salt://states/scripts/global/files/env.jinja
    - template: jinja
    - marker_start: "# {{ pillar.block_msg.scripts.global.start }}"
    - marker_end: "# {{ pillar.block_msg.scripts.global.end }}"
    - append_if_not_found: False
    - backup: False  # backups will be sourced by shell if True
