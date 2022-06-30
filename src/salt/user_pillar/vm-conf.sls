{% set home = salt["pillar.get"]("home") %}
{% set projects = home + "/projects" %}
{% set github_user = "xbc5" %}

{% set nvim_name = "nvim" %}

{% set linux_proj = projects + "/linux" %}

git_clones: {{ home }}/git/clones
git_forks: {{ home }}/git/forks
projects: {{ projects }}

{# this is for repositories that you clone, edit, fork, own etc. #}
{# keep name in sync with real repo name -- it's used for a predictable directory name #}
{# the git key is for changing public repos after clone (without auth) #}
{# TODO: use private key #}
repos:
  my:
    nvim:
      https: https://github.com/{{ github_user }}/nvim.git
      git: git@github.com:{{ github_user }}/nvim.git
      name: {{ nvim_name }}
      path: {{ linux_proj + "/" + nvim_name }}

{# these are for empty directories only, not for repository paths #}
paths:
  projects:
    linux: {{ linux_proj }}
    tools: {{ projects }}/tools
    awesome: {{ projects }}/awesome
    hexo: {{ projects }}/hexo
    webext: {{ projects }}/webext
