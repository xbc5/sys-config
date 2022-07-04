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
  scripts:
    local:
      start: "[LOCAL_SCRIPTS] {{ start }}"
      end: "[LOCAL_SCRIPTS] {{ end }}"
    global:
      start: "[GLOBAL_SCRIPTS] {{ start }}"
      end: "[GLOBAL_SCRIPTS] {{ end }}"
