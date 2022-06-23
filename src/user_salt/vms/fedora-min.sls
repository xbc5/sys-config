fedora-min-template:
  pkg.installed:
    - name: qubes-template-fedora-35-minimal
    - fromrepo: qubes-templates-itl

clone-to-fedora-min:
  qvm.clone:
    - name: fedora-min
    - source: fedora-35-minimal
    - flags:
      - shutdown
