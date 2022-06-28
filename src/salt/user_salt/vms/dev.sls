include:
  - vms.fedora-min

{% extends "vms/default.sls" %}
{% block create-vm %}
  {% block name %}{{ pillar["dev"]["name"] }}{% endblock %}
  {% block label %}{{ pillar["label"][4] }}{% endblock %}
  {% block kernelopts %}{{ pillar["kernelopts"] systemd.unified_cgroup_hierarchy=0 }}
  {% block maxmem %}5000{% endblock %}
  {% block vcpus %}4{% endblock %}
{% endblock create-vm %}
