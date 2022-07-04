fontconfig-installed:
  pkg.installed:
    - name: fontconfig

local-fonts-configured:
  file.managed:
    - source: salt://packages/fontconfig/templatevm/files/local-fonts.jinja
    - template: jinja
    - name: /etc/fonts/local.conf
    - user: root
    - group: root
    - mode: 644
    - replace: True
