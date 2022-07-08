local-zshrc-perms-set:
  file.managed:
    - name: {{ pillar.home }}/.zshrc
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}
    - replace: False
    - mode: 644

zinit-installed-into-local-zshrc:
  file.blockreplace:
    - name: {{ pillar.home }}/.zshrc
    - source: salt://{{ tpldir }}/files/local-zshrc
    - template: jinja
    - marker_start: "# {{ pillar.block_msg.zinit.start }}"
    - marker_end: "# {{ pillar.block_msg.zinit.end }}"
    - append_if_not_found: True
    - defaults:
        script: {{ pillar.paths.scripts.init_zinit }}
