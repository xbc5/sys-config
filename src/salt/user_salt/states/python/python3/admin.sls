include:
  - states.shell.profile.env.admin

python3-installed:
  pkg.installed:
    - name: python3

python3-user-path-set-in-env:
  file.accumulated:
    - require_in:
      - file: {{ pillar.id.env_profile_created }}
    - name: python_user_path
    - filename: {{ pillar.paths.profile.env }}
    - text: "[[ -n \"`command -v python3`\" ]] && PATH=\"`python3 -c 'import site; print(site.USER_BASE)'`/bin:$PATH\""
