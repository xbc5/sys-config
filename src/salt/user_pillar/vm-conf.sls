{% set home = salt["pillar.get"]("home") %}
{% set projects = home + "/projects" %}
{% set github_user = "xbc5" %}

git_clones: {{ home }}/git/clones
git_forks: {{ home }}/git/forks
projects: {{ projects }}

repos:
  my:
    nvim:
      https: https://github.com/{{ github_user }}/nvim.git
      git: git@github.com:{{ github_user }}/nvim.git

paths:
  projects:
    linux: {{ projects }}/linux
    tools: {{ projects }}/tools
    awesome: {{ projects }}/awesome
    hexo: {{ projects }}/hexo
    webext: {{ projects }}/webext
