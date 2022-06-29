{% from "lib/vm.jinja" import templatevm_from %}

{% load_yaml as prefs %}
name: salt-fedora-min
label: black
{% endload %}

{{ templatevm_from(prefs, "qubes-template-fedora-35-minimal") }}
