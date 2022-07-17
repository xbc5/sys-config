local-zshrc-created:
  file.managed:
    - name: {{ pillar.home }}/.zshrc
    - source: salt://{{ tpldir }}/files/local-zshrc
    - template: jinja
    - replace: True
    - mode: 644
    - user: {{ pillar.user }}
    - group: {{ pillar.user }}

