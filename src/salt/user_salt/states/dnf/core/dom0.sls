include:
  - states.dnf.core.admin

{% load_yaml as opts %}
assumeyes: True
clean_requirements_on_remove: True
sslverify: True
exclude: awesome-*
install_weak_deps: False
gpgcheck: True
fastestmirror: True
max_parallel_downloads: 10
{% endload %}

{% for k, v in opts.items() %}
{{ k }}-set-in-dom0-dnf-config:
  file.replace:
    - name: /etc/dnf/dnf.conf
    - append_if_not_found: True
    - flags:
      - MULTILINE
    - show_changes: True
    - pattern: ^{{ k }}=.+$
    - repl: {{ k }}={{ v }}
{% endfor %}
