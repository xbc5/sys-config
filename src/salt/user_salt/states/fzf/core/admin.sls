fzf-installed:
  pkg.installed:
    - name: fzf

fzf-profile-created:
  file.managed:
    - name: {{ pillar.paths.profile.fzf }}
    - source: salt://states/fzf/core/files/fzf.sh
    - user: root
    - group: root
    - mode: 644
    - replace: True
