{# see: https://github.com/Qubes-Community/Contents/blob/master/docs/customization/fedora-minimal-template-customization.md -#}
{# and https://www.qubes-os.org/doc/templates/minimal/ -#}
netvm-core-packages-installed:
  pkg.installed:
    - pkgs:
      - NetworkManager-wifi
      - network-manager-applet
      - wireless-tools # iwlist etc
      - iwl7260-firmware
      - qubes-core-agent-networking
      - qubes-core-agent-network-manager # netvm
      - notification-daemon
      - gnome-keyring
      - polkit
      - dbus-x11
      - tar
      - tiny-proxy
      - iptables
      - dconf
      - dconf-editor
