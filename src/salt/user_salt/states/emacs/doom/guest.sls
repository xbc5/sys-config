include:
  - states.emacs.notes.guest

{% set repo = pillar.repos.doom_emacs %}

{% from "macros/repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
state_name: doom-emacs
user: {{ pillar.user }}
require:
  - git-store-clones-created
  {# we MUST install our custom config first #}
  - doom-emacs-user-config-linked
store_path: {{ repo.path }}
git_https: {{ repo.https }}
app_path: {{ pillar.paths.emacs.conf }}
{% endload %}

{{ appvm_from(prefs) }}

{# we need doomto link to emacs.d first, because that's where the doom script lives #}
doom-emacs-installed:
  cmd.run:
    - require: doom-emacs-linked
    - name: bin/doom install
    - runas: {{ pillar.user }}
    - cwd: {{ pillar.paths.emacs.conf }}
