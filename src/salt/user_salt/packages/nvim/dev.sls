# vim: ft=yaml
include:
  - fs.project-dirs

nvim-dev-config-cloned:
  git.latest:
    - name: https://github.com/xbc5/nvim.git
    - target: /home/user/projects/linux/nvim
    - user: user
    - force_clone: True
    - force_checkout: True
    - force_reset: True

nvim-dev-remote-changed:
  cmd.run:
    - name: git remote set-url origin git@github.com:xbc5/nvim.git
    - runas: user
    - cwd: /home/user/projects/linux/nvim

nvim-dev-config-perms-set:
  file.directory:
    - name: /home/user/projects/linux/nvim
    - user: user
    - group: user
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
