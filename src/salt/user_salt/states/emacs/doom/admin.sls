# vim: ft=yaml
include:
  - states.emacs.core.admin
  - states.fzf.core.admin  # a script uses FZF
  - states.ssh.core.admin  # there's an SSH script

doom-emacs-env-installed:
  file.managed:
    - name: /etc/profile.d/doom.sh
    - source: salt://states/emacs/doom/files/doom.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
