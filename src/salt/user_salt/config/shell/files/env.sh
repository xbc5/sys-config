export QUBES_GPG_DOMAIN="vault"
export PAGER="less -R"
export EDITOR="nvim"
export TIME_STYLE="long-iso"
export MY_SCRIPTS="{{ pillar.paths.scripts.base }}"

PATH="${MY_SCRIPTS}:${PATH}"
PATH="${HOME}/WIP:${PATH}"

# These should be prepended, and PNPM bins take precedence over NPM
# {{ pillar.block_msg.npm.start }}
# {{ pillar.block_msg.npm.end }}

# {{ pillar.block_msg.pnpm.start }}
# {{ pillar.block_msg.pnpm.end }}

export PATH
