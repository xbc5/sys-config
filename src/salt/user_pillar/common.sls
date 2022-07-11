{% set user = "user" %}
{% set home = "/home/" + user %}
{% set start = "START AUTO-GENERATED: DO NOT EDIT" %}
{% set end = "END AUTO-GENERATED: DO NOT EDIT" %}

user: {{ user }}
home: {{ home }}

block_msg:
  pnpm:
    start: "[PNPM] {{ start }}"
    end: "[PNPM] {{ end }}"
  npm:
    start: "[NPM] {{ start }}"
    end: "[NPM] {{ end }}"
  misc:
    start: "[MISC] {{ start }}"
    end: "[MISC] {{ end }}"
  zinit:
    start: "[ZINIT] {{ start }} AFTER THIS LINE"
    end: "[ZINIT] {{ end }} AFTER THIS LINE"
  completions:
    start: "[ZINIT-COMPS] {{ start }}"
    end: "[ZINIT-COMPS] {{ end }}"
  plugins:
    start: "[PLUG-INS] {{ start }}"
    end: "[PLUG-INS] {{ end }}"
  scripts:
    local:
      start: "[LOCAL_SCRIPTS] {{ start }}"
      end: "[LOCAL_SCRIPTS] {{ end }}"
    global:
      start: "[GLOBAL_SCRIPTS] {{ start }}"
      end: "[GLOBAL_SCRIPTS] {{ end }}"

{# these IDs are required by other states, this make them less brittle -#}
{# TODO: make these IDs less hierarchical and more descriptive -#}
id:
  env_profile_created: {{ salt.pillar.get("paths:profile:env") }}-created
  scripts:
    init_zinit:
      comps: comps-zone-created-in-zinit-script
      plugins: plugins-zone-created-in-zinit-script
    global:
      dir_created: global-scripts-dir-created
