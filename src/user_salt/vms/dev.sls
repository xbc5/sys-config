salt-dev:
  qvm.vm:
    - actions:
      - present
      - prefs
    - present:
      - template: fedora-min
      - label: green
      - mem: 2000
      - vcpus: 4
    - prefs:
      - maxmem: 5000
      - include-in-backups: false
      - netvm: mfw
      - virt-mode: pvh
      - qrexec-timeout: 300
      - autostart: false
      - default-user: user
      - kernelopts: nopat ipv6.disable=1
