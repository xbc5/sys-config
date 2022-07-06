exa-installed:
  pkg.installed:
    - name: exa

shell-profile-created:
  file.managed:
    - name: {{ pillar.paths.profile.exa }}
    - replace: False
    - mode: 644
    - user: root
    - group: root
