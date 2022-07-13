# vim: ft=yaml
include:
  - states.dnf.core.admin

rawhide-repo-installed:
  pkg.installed:
    - watch_in:
      - cmd: dnf-repo-protocol-set-to-https
    - name: fedora-repos-rawhide
