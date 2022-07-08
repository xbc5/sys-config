include:
  - states.shell.zsh.zinit.admin

docker-completions-installed-via-zinit:
  file.accumulated:
    - filename: {{ pillar.paths.scripts.init_zinit }}
    - text: |
        zinit ice wait'3' lucid as'completion'
        zinit snippet https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
    - require_in:
      - file: {{ pillar.id.scripts.init_zinit.comps }}
