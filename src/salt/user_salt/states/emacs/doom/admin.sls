# vim: ft=yaml
include:
  - states.emacs.core.admin

doom-emacs-env-installed:
  file.managed:
    - require: emacs-installed
    - name: {{ pillar.paths.profile.doom }}
    - source: salt://{{ tpldir }}/files/doom.sh
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
