include:
  - states.shell.zsh.core.guest

zinit-initialised-in-local-zshrc:
  file.blockreplace:
    - require:
      - file: local-zshrc-created
    - name: {{ pillar.home }}/.zshrc
    - content: 'source "{{ pillar.paths.scripts.init_zinit }}"'
    - marker_start: "# {{ pillar.block_msg.zinit.start }}"
    - marker_end: "# {{ pillar.block_msg.zinit.end }}"
    - append_if_not_found: False

starship-initialised-in-local-zshrc:
  file.blockreplace:
    - require:
      - file: zinit-initialised-in-local-zshrc
    - name: {{ pillar.home }}/.zshrc
    - content: '[[ -n "`command -v starship`" ]] && eval "$(starship init zsh)"'
    - marker_start: "# {{ pillar.block_msg.prompt.start }}"
    - marker_end: "# {{ pillar.block_msg.prompt.end }}"
    - append_if_not_found: True  # it's always defined last anyway 
