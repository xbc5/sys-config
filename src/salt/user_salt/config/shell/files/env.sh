export QUBES_GPG_DOMAIN="vault"
export PAGER="less -R"
export EDITOR="nvim"
export TIME_STYLE="long-iso"

# {{ pillar.block_msg.scripts.global.start }}
# {{ pillar.block_msg.scripts.global.end }}
# {{ pillar.block_msg.scripts.local.start }}
# {{ pillar.block_msg.scripts.local.end }}

PATH="${HOME}/WIP:${PATH}"

# These should be prepended, and PNPM bins take precedence over NPM
# {{ pillar.block_msg.npm.start }}
# {{ pillar.block_msg.npm.end }}

# {{ pillar.block_msg.pnpm.start }}
# {{ pillar.block_msg.pnpm.end }}

export PATH
