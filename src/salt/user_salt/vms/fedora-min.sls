{{ pillar["template"]["pkg"] }}-installed:
  pkg.installed:
    - name: {{ pillar["template"]["pkg"] }}
    - fromrepo: qubes-templates-itl

clone-template-pkg-to-{{ pillar["template"]["name"] }}:
  qvm.clone:
    - name: {{ pillar["template"]["name"] }}
    - source: fedora-min # FIXME: clone from package when qvm.template-installed exists #1
    - flags:
      - shutdown

{% extends "vms/default.sls" %}
{% block create_vm %}
  {% block name %}{{ pillar["template"]["name"] }}{% endblock %}
  {% block label %}{{ pillar["label"][6] }}{% endblock %}
  {% block vcpus %}4{% endblock %}
{% endblock create_vm %}
