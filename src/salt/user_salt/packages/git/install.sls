# WARN: git requires known_hosts, else clones fail
include:
  - packages.ssh.client # provides known_hosts too
  - packages.kitty.templatevm.install # my configured difftool requires it

git-installed:
  pkg.installed:
    - name: git

global-git-config-installed:
  file.managed:
    - name: /etc/gitconfig
    - source: salt://packages/git/files/gitconfig
    - user: root
    - group: root
    - mode: 644
