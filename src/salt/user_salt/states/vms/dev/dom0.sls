{% from "macros/vm.jinja" import appvm_from, with_default %}

{% load_yaml as prefs %}
name: {{ pillar.dev.name }}
label: {{ pillar.label[4] }}
kernelopts: {{ with_default("kernelopts", "systemd.unified_cgroup_hierarchy=0") }}
maxmem: 5000
vcpus: 4
{% endload %}

{{ appvm_from(prefs) }}
