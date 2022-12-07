include:
  - states.fs.projects.guest

{% set repo = pillar.repos.my.emacs_notes %}

{% from "macros/my-repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
state_name: doom-emacs-user-config
user: {{ pillar.user }}
proj_include: linux-project-dir-created
store_path: {{ repo.path }}
app_path: {{ pillar.paths.doom_emacs.conf }}
git_https: {{ repo.https }}
git_ssh: {{ repo.git }}
{% endload %}
i

{{ appvm_from(prefs) }}
