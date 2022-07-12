{# this is for templatevm only because dom0 dnf is older -#}
{# and has different configuration options, Also, I don't want -#}
{# to mess with the plug-in system. -#}

dnf-plugins-core-installed:
  pkg.installed:
    - name: dnf-plugins-core

dnf-configured:
  file.keyvalue:
    - name: /etc/dnf/dnf.conf
    - separator: "="
    - append_if_not_found: True
    - show_changes: True
    - key_values:
        assumeyes: True
        localpkg_gpgcheck: True
        sslverify: True
        excludepkgs: awesome-*
        install_weak_deps: False
        {# mozilla-openh264 is vanilla HTTP and is only for WebRTC streaming -#}
        {# not for general playback. -#}
        exclude_from_weak: mozilla-openh264
        gpgcheck: True
        exit_on_lock: True
        gpgkey_dns_verification: False
        fastestmirror: True
        max_parallel_downloads: 10

dnf-repo-protocol-set-to-https:
  cmd.script:
    - source: salt://{{ tpldir }}/files/set-https.py
    - runas: root
