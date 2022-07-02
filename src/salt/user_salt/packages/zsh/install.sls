zsh-installed:
  pkg.installed:
    - name: zsh

global-zshrc-installed:
  file.blockreplace:
    - name: /etc/zshrc
    - source: salt://packages/zsh/files/global-zshrc
    - marker_start: "# {{ pillar.block_msg.misc.start }}"
    - marker_end: "# {{ pillar.block_msg.misc.end }}"
    - append_if_not_found: True

global-zshrc-perms-set:
  file.managed:
    - name: /etc/zshrc
    - user: root
    - group: root
    - mode: 644
    - replace: False

set-default-shell-to-zsh-for-root:
  cmd.run:
    - runas: root
    - name: usermod --shell /bin/zsh root

set-default-shell-to-zsh-for-{{ pillar.user }}:
  cmd.run:
    - runas: root
    - name: usermod --shell /bin/zsh {{ pillar.user }}
