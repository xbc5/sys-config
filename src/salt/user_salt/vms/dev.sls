include:
  - vms.fedora-min # FIXME: use pillar

ensure-dev-vm-is-present:
  qvm.present:
    - name: {{ pillar["qvm-prefs"]["dev"]["name"] }}
    - template: salt-fedora-min
    - label: green

set-dev-vm-prefs:
  qvm.prefs:
    - name: {{ pillar["qvm-prefs"]["dev"]["name"] }}
    - label: green
    - template: salt-fedora-min
    - mem: 1000
    - maxmem: 5000
    - vcpus: 4
    - include-in-backups: false
    - netvm: mfw
    - virt-mode: pvh
    - qrexec-timeout: 300
    - autostart: false
    - default-user: user
    - kernelopts: nopat ipv6.disable=1
