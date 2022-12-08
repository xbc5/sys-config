{% set home = salt["pillar.get"]("home") %}
{% set projects = home + "/projects" %}
{% set github_user = "xbc5" %}

{% set nvim_name = "nvim" %}

{% set linux_proj = projects + "/linux" %}
{% set git_clones = home + "/git/clones" %}

{% set global_scripts = "/usr/scripts" %}
{% set local_scripts = "/usr/local/scripts" %}
{% set profile_dir = "/etc/profile.d" %}

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
    emacs_notes:
      https: https://github.com/{{ github_user }}/emacs-notes.git
      git: git@github.com:{{ github_user }}/emacs-notes.git
      name: emacs-notes
      path: {{ notes_path }}
  pyenv:
    https: https://github.com/pyenv/pyenv.git
    name: pyenv
    path: {{ home }}/.pyenv  # recommended by pyenv docs
  doom_emacs:
    https: https://github.com/doomemacs/doomemacs.git
    name: doomemacs
    path: {{ git_clones }}/doomemacs
  pyenv_virtualenv:
    https: https://github.com/pyenv/pyenv-virtualenv.git 
    name: pyenv-virtualenv
    path: {{ home }}/.pyenv/plugins/pyenv-virtualenv

{# these are for empty directories only, not for repository paths #}
paths:
  docker:
    data: /var/lib/docker
  doom_emacs:
    conf: {{ home }}/.doom.d
  emacs:
    conf: {{ home }}/.emacs.d
    confd: .emacs.d
  git:
    clones: {{ git_clones }}
    forks: {{ home }}/git/forks
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
    fzf: {{ profile_dir }}/fzf.sh
    functions: {{ profile_dir }}/functions.sh
    exa: {{ profile_dir }}/exa.sh
    git: {{ profile_dir }}/git.sh

fonts:
  nerd:
    ver: 2.1.0
    specs:
      - name: DejaVuSansMono
        type: Regular
        filename: "DejaVu Sans Mono Nerd Font Complete Mono.ttf"
