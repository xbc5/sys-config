include:
  - states.fontconfig.locals.guest # create local font dir and cache
  - states.scripts.local.guest # create the destination for the font test script

{% set ver = pillar.fonts.nerd.ver %}

{# this will only install a font if it doesn't exist. #}
{% for font in pillar.fonts.nerd.specs %}
{{ font.name }}-{{ font.type}}-{{ ver }}-installed:
  cmd.script:
    - source: salt://states/fonts/nerd/files/get-nerd-font.sh
    - args: "'{{ pillar.paths.fontconfig.local.fonts }}' '{{ ver }}' '{{ font.name }}' '{{ font.type }}' '{{ font.filename }}'"
    - runas: root
    - creates: 
      - {{ pillar.paths.fontconfig.local.fonts }}/{{ font.filename }}
{% endfor %}

font-cache-updated:
  cmd.run:
    - name: fc-cache --verbose --force --really-force
    - runas: root

nerd-font-test-script-installed:
  file.managed:
    - name: {{ pillar.paths.scripts.local }}/test-nerd-fonts
    - source: https://raw.githubusercontent.com/ryanoasis/nerd-fonts/{{ ver }}/bin/scripts/test-fonts.sh
    - skip_verify: True  # no hash
    - user: root
    - group: root
    - mode: 755
    - replace: True
    
