{% set home = salt["pillar.get"]("home") %}
{% set projects = home + "/projects" %}
{% set github_user = "xbc5" %}

{% set nvim_name = "nvim" %}

{% set linux_proj = projects + "/linux" %}
{% set global_scripts = "/usr/scripts" %}
{% set local_scripts = "/usr/local/scripts" %}
{% set profile_dir = "/etc/profile.d" %}

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
  scripts:
    local: {{ local_scripts }}
    global: {{ global_scripts }}
    init_zinit: {{ global_scripts }}/init-zinit
  fontconfig:
    local:
      fonts: /usr/local/share/fonts
      cache: /usr/local/share/fontconfig/cache
  profile_dir: {{ profile_dir }}
  profile:
    {# the keys are the file names, they must match its *.sh #}
    aliases: {{ profile_dir }}/aliases.sh
    env: {{ profile_dir }}/env.sh
    functions: {{ profile_dir }}/functions.sh

fonts:
  nerd:
    ver: 2.1.0
    specs:
      - name: DejaVuSansMono
        type: Regular
        filename: "DejaVu Sans Mono Nerd Font Complete Mono.ttf"
