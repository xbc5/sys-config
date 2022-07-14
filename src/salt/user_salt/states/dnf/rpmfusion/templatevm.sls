include:
  - states.dnf.core.admin

rpmfusion-free-repo-installed:
  cmd.run:
    - watch_in:
      - cmd: dnf-repo-protocol-set-to-https
    - require:
      - pkg: all-dnf-gpg-keys-installed
    - runas: root
    {# no --assumeyes because keys should already be installed and verified by requisite -#}
    - name: dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

rpmfusion-repo-enabled:
  cmd.run:
    - require:
      - cmd: rpmfusion-free-repo-installed
      - pkg: dnf-plugins-core-installed  # config-manager is a plug-in
    - runas: root
    - name: |
        dnf config-manager --set-enabled rpmfusion-free; \
          dnf config-manager --set-enabled rpmfusion-free-updates
