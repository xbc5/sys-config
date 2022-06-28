include:
  - vms.fedora-min

ensure-{{ pillar["dev"]["name"] }}-vm-is-present:
  qvm.present:
    - name: {{ pillar["dev"]["name"] }}
    - template: {{ pillar["template"]["name"] }}
    - label: {{ pillar["label"][4] }}

set-dev-vm-prefs:
  qvm.prefs:
    - name: {{ pillar["dev"]["name"] }}
    - label: {{ pillar["label"][4] }}
    - template: {{ pillar["default"]["template"] }} # FIXME: rely on qubes-prefs
    - mem: {{ pillar["default"]["mem"] }}
    - maxmem: 5000
    - default_dispvm: {{ pillar["default"]["dispvm"] }}
    - vcpus: 4
    - include-in-backups: {{ pillar["default"]["backup"] }}
    - netvm: ""
    - virt-mode: {{ pillar["default"]["netvm"] }}
    - qrexec-timeout: ""
    - autostart: False
    - default-user: {{ pillar["default"]["user"] }} 
    - kernelopts: {{ pillar["default"]["kernelopts"] }}
