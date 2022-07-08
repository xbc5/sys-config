include:
  - states.shell.zsh.core.admin
  - states.fzf.core.admin  # several plug-ins use FZF
  - states.ssh.core.admin  # there's an SSH plugin
  - states.git.core.admin  # git plug-ins, also zinit itself

{% set out = pillar.paths.scripts.init_zinit %}

zinit-init-script-installed:
  file.managed:
    - name: {{ out }}
    - source: salt://{{ tpldir }}/files/init-zinit.jinja
    - template: jinja
    - user: root
    - group: root
    - replace: True
    - mode: 755

{{ pillar.id.scripts.init_zinit.comps }}:
  file.blockreplace:
    - require:
      - zinit-init-script-installed
    - name: {{ out }}
    - content: "# BUG: indentation is broken, see issue #80"
    - marker_start: "# {{ pillar.block_msg.completions.start }}"
    - marker_end: "# {{ pillar.block_msg.completions.end }}"
    - backup: False

{{ pillar.id.scripts.init_zinit.plugins }}:
  file.blockreplace:
    - require:
      - zinit-init-script-installed
    - name: {{ out }}
    - content: "# BUG: indentation is broken, see issue #80"
    - marker_start: "# {{ pillar.block_msg.plugins.start }}"
    - marker_end: "# {{ pillar.block_msg.plugins.end }}"
    - backup: False
