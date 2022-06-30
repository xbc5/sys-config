{% from "lib/vm.jinja" import templatevm_from %}

{% load_yaml as prefs %}
name: {{ pillar.template.name }}
label: {{ pillar.label[6] }}
{% endload %}

{{ templatevm_from(prefs, pillar.template.pkg) }}
