{% block create-vm %}
{% block name %}{% endblock %}-is-present:
  qvm.present:
    - name: {{ self.name() }}
    - template: {% block template %}salt-fedora-min{% endblock %} # FIXME: set to "" for default
    - label: {% block label %}{% endblock %}

{{ self.name() }}-prefs-set:
  qvm.prefs:
    - autostart: {% block autostart %}False{% endblock %} 
    - default-dispvm: {% block default-dispvm %}fedora-dvm{% endblock %} 
    - default-user: {% block default-user %}user{% endblock %} 
    - include-in-backups: {% block include-in-backups %}False{% endblock %} 
    - kernelopts: {% block kernelopts %}nopat ipv6.disable=1{% endblock %} 
    - label: {{ self.label() }}
    - management-dispvm: {% block management-dispvm %}mgmt{% endblock %} 
    - maxmem: {% block maxmem %}1500{% endblock %} 
    - mem: {% block mem %}600{% endblock %} 
    - name: {{ self.name() }}
    - netvm: {% block netvm %}""{% endblock %} 
    - qrexec-timeout: {% block qrexec-timeout %}""{% endblock %} 
    - template: {{ self.template() }}
    - vcpus: {% block vcpus %}1{% endblock %} 
    - virt-mode: {% block virt-mode %}pvh{% endblock %} 
{% endblock create-vm %}
