# vim: ft=yaml
include:
  - states.emacs.core.admin

doom-emacs-env-installed:
  file.managed:
    - require: emacs-installed
    - name: /etc/profile.d/doom.sh
    - source: salt://states/emacs/doom/files/doom.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
