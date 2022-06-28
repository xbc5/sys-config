# vim: ft=yaml
git-store-clones-created:
  file.directory:
    - name: /home/user/git/clones
    - user: user
    - group: user
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode

git-store-forks-created:
  file.directory:
    - name: /home/user/git/forks
    - user: user
    - group: user
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
