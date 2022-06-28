dev:
  name: salt-dev

template:
  name: salt-fedora-min
  pkg: qubes-template-fedora-35-minimal

default:
  dispvm: fedora-dvm
  backup: False
  kernelopts: nopat ipv6.disable=1
  mem: 600
  maxmem: 1500
  netvm: mfw
  user: user
  vcpus: 1
  clockvm: net
  updatevm: updates-proxy
