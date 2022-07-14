dnf-repo-protocol-set-to-https:
  cmd.script:
    - source: salt://{{ tpldir }}/files/set-https.py
    - runas: root

dnf-plugins-core-installed:
  pkg.installed:
    - name: dnf-plugins-core

all-dnf-gpg-keys-installed:
  pkg.installed:
    - name: distribution-gpg-keys
