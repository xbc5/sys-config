exa-installed:
  pkg.installed:
    - name: exa

shell-initialised:
  file.managed:
    - name: /etc/profile.d/exa.sh
    - source: salt://packages/exa/files/exa.sh
    - user: root
    - group: root
    - mode: 644
    - replace: True
