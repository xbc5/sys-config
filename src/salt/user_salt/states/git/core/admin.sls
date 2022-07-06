# WARN: git requires known_hosts, else clones fail
include:
  - states.ssh.core.admin # provides known_hosts too
  - states.kitty.core.admin # the git config uses kitty diff tool

git-installed:
  pkg.installed:
    - name: git

global-git-config-installed:
  file.managed:
    - name: /etc/gitconfig
    - source: salt://states/git/core/files/gitconfig
    - user: root
    - group: root
    - mode: 644

git-profile-installed:
  file.managed:
    - name: {{ pillar.paths.profile.git }}
    - source: salt://states/git/core/files/git.sh
    - user: root
    - group: root
    - mode: 644
