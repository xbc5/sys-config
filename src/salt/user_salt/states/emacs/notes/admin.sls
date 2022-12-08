# vim: ft=yaml
include:
  - states.emacs.doom.admin

{#
  Doom admin.sls only installs an env file, but since we want a complete
  Doom installation for this, it's best to make it a dependency
#}

emacs-notes-service-unit-installed:
  file.managed:
    - require: doom-emacs-env-installed
    - name: {{ pillar.paths.systemd.user }}/emacs-notes.service
    - source: salt://{{ tpldir }}/files/emacs-notes.service
    - user: root
    - group: root
    - replace: True
    - mode: 644
    - template: jinja
