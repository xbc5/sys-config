ensure-fedora-min-template-installed:
  pkg.installed:
    - name: qubes-template-fedora-35-minimal
    - fromrepo: qubes-templates-itl

clone-fedora-min-base-to-fedora-min:
  qvm.clone:
    - name: salt-fedora-min
    - source: fedora-min
    - flags:
      - shutdown

fedora-min-prefs-set:
  qvm.prefs:
    - name: salt-fedora-min
    - label: {{ pillar["label"][6] }}
    - netvm: None
