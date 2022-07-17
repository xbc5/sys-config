export QUBES_GPG_DOMAIN="vault"
export PAGER="less -R"
export EDITOR="nvim"
export TIME_STYLE="long-iso"

{% for declaration in accumulator["python_user_path"] %}
  {{- declaration }}
{% endfor %}

export MY_GLOBAL_SCRIPTS="{{ pillar.paths.scripts.global }}"
PATH="${MY_GLOBAL_SCRIPTS}:${PATH}"
export MY_LOCAL_SCRIPTS="{{ pillar.paths.scripts.local }}"
PATH="${MY_LOCAL_SCRIPTS}:${PATH}"

export WIP="${HOME}/WIP"
PATH="${WIP}:${PATH}"

export PATH
