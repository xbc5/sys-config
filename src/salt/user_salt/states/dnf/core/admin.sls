dnf-repo-protocol-set-to-https:
  cmd.script:
    - source: salt://{{ tpldir }}/files/set-https.py
    - runas: root
