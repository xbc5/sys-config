ensure-{{ pillar["template"]["pkg"] }}-installed:
  pkg.installed:
    - name: {{ pillar["template"]["pkg"] }}
    - fromrepo: qubes-templates-itl

clone-template-pkg-to-{{ pillar["template"]["name"] }}:
  qvm.clone:
    - name: {{ pillar["template"]["name"] }}
    - source: fedora-min # FIXME: clone from package when qvm.template-installed exists #1
    - flags:
      - shutdown

fedora-min-prefs-set:
  qvm.prefs:
    - name: {{ pillar["template"]["name"] }}
    - label: {{ pillar["label"][6] }}
    - netvm: ""
