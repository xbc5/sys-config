include:
  - states.fontconfig.core.admin 

local-fonts-configured:
  file.managed:
    - source: salt://states/fontconfig/locals/files/local-conf.jinja
    - template: jinja
    - name: /etc/fonts/local.conf
    - user: root
    - group: root
    - mode: 644
    - replace: True
