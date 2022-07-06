include:
  - states.exa.core.admin

shell-initialised:
  file.managed:
    - name: {{ pillar.paths.profile.exa }}
    - source: salt://states/exa/aliases/files/exa.sh
    - replace: True
