include:
  - states.fs.projects.guest
  - states.emacs.doom.guest

{% set repo = pillar.repos.my.emacs_notes %}

{% from "macros/repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
user: {{ pillar.user }}
require: 
  - linux-project-dir-created
require_in:
  - doom-emacs-installed
store_path: {{ repo.path }}
app_path: {{ pillar.paths.doom_emacs.conf }}
git_https: {{ repo.https }}
git_ssh: {{ repo.git }}
{% endload %}

{{ appvm_from(prefs) }}
