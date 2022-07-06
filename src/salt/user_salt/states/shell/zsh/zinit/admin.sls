include:
  - states.shell.zsh.core.admin

{% set out = pillar.paths.scripts.init_zinit %}

zinit-init-script-installed:
  file.managed:
    - name: {{ out }}
    - source: salt://states/shell/zsh/zinit/files/init-zinit
    - user: root
    - group: root
    - replace: True
    - mode: 755
