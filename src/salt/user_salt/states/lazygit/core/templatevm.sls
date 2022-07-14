include:
  - states.dnf.core.admin
  - states.dnf.copr.templatevm

lazygit-installed:
  file.managed:
    - watch_in:
      - cmd: dnf-repo-protocol-set-to-https
    - require:
      - pkg: copr-keys-installed  # gpgkey= points to installed key
    - name: /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:atim:lazygit.repo
    - source: salt://{{ tpldir }}/files/lazygit.repo
    - user: root
    - group: root
    - mode: 644
    - replace: True
    - backup: False
  pkg.installed:
    - name: lazygit
