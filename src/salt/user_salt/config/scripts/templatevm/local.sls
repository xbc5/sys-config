include:
  - config.shell.profile

local-scripts-path-set:
  file.blockreplace:
    - name: {{ pillar.paths.profile.env }}
    - source: salt://config/scripts/templatevm/files/local-env.jinja
    - template: jinja
    - marker_start: "# {{ pillar.block_msg.scripts.local.start }}"
    - marker_end: "# {{ pillar.block_msg.scripts.local.end }}"
    - append_if_not_found: False
    - backup: False  # backups will be sourced by shell if True
