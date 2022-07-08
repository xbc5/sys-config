include:
  - states.jq.core.admin
  - states.shell.zsh.zinit.admin

jq-zsh-plugin-installed-via-zinit:
  file.accumulated:
    - filename: {{ pillar.paths.scripts.init_zinit }}
    - text: |
          # JQ + FZF: interactive queries. <query> alt+j; shift-up|down; alt+r (reload); alt+up|down
          zinit ice wait lucid
          zinit light reegnz/jq-zsh-plugin
    - require_in:
      - file: {{ pillar.id.scripts.init_zinit.plugins }}
