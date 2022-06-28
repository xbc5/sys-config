# vim: ft=yaml
ssh-client-installed:
  pkg.installed:
    - name: openssh

/etc/ssh/ssh_known_hosts:
  file.managed:
    - source: salt://packages/ssh/files/known_hosts
    - mkdirs: True
    - user: root
    - group: root
    - makedirs: True
    - replace: True # always use the given hosts
    - mode: 664 # adds +x if makedirs
