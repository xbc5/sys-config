kitty-installed:
  pkg.installed:
    - name: kitty

{% for name in ["diff.conf", "kitty.conf"] %}
kitty-global-{{ name }}-installed:
  file.managed:
    - name: /etc/xdg/kitty/{{ name }}
    - source: salt://states/kitty/core/files/{{ name }}
    - user: root
    - group: root
    - mode: 644
    - replace: True
{% endfor %}
