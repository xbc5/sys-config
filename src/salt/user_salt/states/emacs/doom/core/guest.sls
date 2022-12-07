include:
  - states.git.store.guest

{% set repo = pillar.repos.doom_emacs %}

{% from "macros/repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
state_name: doom-emacs
user: {{ pillar.user }}
proj_include: git-store-clones-created
store_path: {{ repo.path }}
git_https: {{ repo.https }}
{% endload %}

{{ appvm_from(prefs) }}
