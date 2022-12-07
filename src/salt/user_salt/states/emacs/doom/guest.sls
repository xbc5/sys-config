include:
  - states.emacs.notes.guest

{% set repo = pillar.repos.doom_emacs %}

{% from "macros/repo-cloner.jinja" import clone %}

{% load_yaml as prefs %}
state_name: doom-emacs
user: {{ pillar.user }}
require:
  - git-store-clones-created
store_path: {{ repo.path }}
git_https: {{ repo.https }}
{% endload %}

{{ appvm_from(prefs) }}

doom-emacs-installed:
  cmd.run:
    - require: doom-emacs-cloned
    - name: bin/doom install
    - runas: {{ pillar.user }}
    - cwd: {{ pillar.paths.doom_emacs.conf }}
