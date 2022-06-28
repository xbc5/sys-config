dev:
  name: salt-dev

template:
  name: salt-fedora-min
  pkg: qubes-template-fedora-35-minimal

default:
  dispvm: fedora-dvm
  backup: False
  kernelopts: nopat ipv6.disable=1
  maxmem: 1500
  mem: 600
  mgmt: mgmt
  netvm: mfw
  user: user
  vcpus: 1
  clockvm: net
  updatevm: updates-proxy
  virtmode: pvh
