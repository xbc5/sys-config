pip3-installed:
  pkg.installed:
    - name: python3-pip

pip3-configured:
  file.managed:
    - name: /etc/xdg/pip/pip.conf
    - source: salt://{{ tpldir }}/files/pip.conf
    - mode: 644
    - user: root
    - group: root
    - makedirs: True
    - replace: True
