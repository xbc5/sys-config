include:
  - states.git.store.guest

{% set repo = pillar.repos.doom_emacs %}

{% from "macros/repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
user: {{ pillar.user }}
require:
  - git-store-clones-created
store_path: {{ repo.path }}
git_https: {{ repo.https }}
app_path: {{ pillar.paths.emacs.conf }}
{% endload %}

doom-emacs-installed:
  {{ clone(prefs) }}
  cmd.run:
    - name: bin/doom install
    - runas: {{ pillar.user }}
    - cwd: {{ pillar.paths.emacs.conf }}

doom-emacs-plugins-installed:
  {{ clone(prefs) }}
  cmd.run:
    - require: doom-emacs-installed
    - name: bin/doom sync
    - runas: {{ pillar.user }}
    - cwd: {{ pillar.paths.emacs.conf }}
