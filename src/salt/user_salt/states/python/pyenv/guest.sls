include:
  - states.shell.zsh.local-profile.guest  # creates ~/.profile etc
  - states.shell.zsh.core.guest           # creates ~/.zshrc etc

pyenv-cloned-and-latest:
  git.latest:
    - name: {{ pillar.repos.pyenv.https }}
    - target: {{ pillar.repos.pyenv.path }}
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

pyenv-virtualenv-plugin-cloned-and-latest:
  git.latest:
    - name: {{ pillar.repos.pyenv_virtualenv.https }}
    - target: {{ pillar.repos.pyenv_virtualenv.path }}
    - user: {{ pillar.user }}
    - force_clone: True
    - force_checkout: True
    - force_reset: True

{# This sets up your path (including shims). #}
pyenv-added-to-{{ pillar.home }}/.zprofile:
  file.append:
    - require:
      - file: local-zprofile-created
      - git: pyenv-cloned-and-latest
    - name: {{ pillar.home }}/.zprofile
    - text:
      - export PYENV_ROOT="{{ pillar.repos.pyenv.path }}"
      - export PATH="$PYENV_ROOT/bin:$PATH"
      - eval "$(pyenv init --path)"

{# This initialises your shell: completions, entry point function etc. #}
penv-initialised-in-local-zshrc:
  file.blockreplace:
    - require:
      - file: local-zshrc-created
    - name: {{ pillar.home }}/.zshrc
    - content: |
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    - marker_start: "# {{ pillar.block_msg.pyenv.start }}"
    - marker_end: "# {{ pillar.block_msg.pyenv.end }}"
    - append_if_not_found: False
