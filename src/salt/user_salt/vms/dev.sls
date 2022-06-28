include:
  - vms.fedora-min

ensure-{{ pillar["dev"]["name"] }}-vm-is-present:
  qvm.present:
    - name: {{ pillar["dev"]["name"] }}
    - template: {{ pillar["template"]["name"] }}
    - label: {{ pillar["label"][4] }}

set-dev-vm-prefs:
  qvm.prefs:
    - autostart: False
    - default-dispvm: {{ pillar["default"]["dispvm"] }}
    - default-user: {{ pillar["default"]["user"] }} 
    - include-in-backups: {{ pillar["default"]["backup"] }}
    - kernelopts: {{ pillar["default"]["kernelopts"] }}
    - label: {{ pillar["label"][4] }}
    - management-dispvm: {{ pillar["default"]["mgmt"] }}
    - maxmem: 5000
    - mem: {{ pillar["default"]["mem"] }}
    - name: {{ pillar["dev"]["name"] }}
    - netvm: ""
    - qrexec-timeout: ""
    - template: {{ pillar["default"]["template"] }} # FIXME: rely on qubes-prefs
    - vcpus: 4
    - virt-mode: {{ pillar["default"]["virtmode"] }}
