per-vm-systemd-docker-unit-installed:
  file.managed:
    - require:
      - docker-ce-installed
    - name: /etc/systemd/system/docker.service.d/30_qubes.conf
    - source: salt://{{ tpldir }}/files/docker_unit.conf
    - makedirs: True
    - mode: 644
    - user: root
    - group: root
    - replace: True
    - backup: False
    - recurse:
      - user
      - group
      - mode
