# vim: ft=yaml
ssh-client-installed:
  pkg.installed:
    - name: openssh

global-ssh-known-hosts-installed:
  file.managed:
    - name: /etc/ssh/ssh_known_hosts
    - source: salt://states/ssh/core/files/known_hosts
    - user: root
    - group: root
    - makedirs: True
    - replace: True
    - mode: 664 # adds +x if makedirs
