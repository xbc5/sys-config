include:
  - states.shell.zsh.core.admin
  - states.fzf.core.admin  # several plug-ins use FZF
  - states.ssh.core.admin  # there's an SSH plugin
  - states.git.core.admin  # git plug-ins, also zinit itself

{% set out = pillar.paths.scripts.init_zinit %}

zinit-init-script-installed:
  file.managed:
    - name: {{ out }}
    - source: salt://states/shell/zsh/zinit/files/init-zinit
    - user: root
    - group: root
    - replace: True
    - mode: 755
