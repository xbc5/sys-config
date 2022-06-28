# vim: ft=yaml
linux-project-dir-created:
  file.directory:
    - name: /home/user/projects/linux
    - user: user
    - group: user
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
