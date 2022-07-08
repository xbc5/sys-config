bind-docker-dirs:
  file.managed:
    - name: /rw/config/qubes-bind-dirs.d/50_docker.conf
    - source: salt://{{ tpldir }}/files/bind_dirs.jinja
    - template: jinja
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
