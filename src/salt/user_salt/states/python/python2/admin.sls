include:
  - states.shell.profile.env.admin

python2-installed:
  pkg.installed:
    - name: python2.7

python2-user-path-set-in-env:
  file.accumulated:
    - require_in:
      - file: {{ pillar.id.env_profile_created }}
    - name: python_user_path
    - filename: {{ pillar.paths.profile.env }}
    - text: "[[ -n \"`command -v python2`\" ]] && PATH=\"`python2 -c 'import site; print(site.USER_BASE)'`/bin:$PATH\""
