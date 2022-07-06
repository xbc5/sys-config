The `prepare.sh` script is for Qubes only. It will modify files on the root file system -- which is protected by COW under Qubes. This script allows you to quickly symlink local files to system files. It does so by backing up the target, and replacing it with a symlink to the local repo files.

```bash
./prepare.sh kitty kitty.conf diff.conf
```

The first argument is a directory name within the repo, which contains files. The remaining arguments are those file names. You must set the appropriate paths in `.env` for it to work. If you intend to extend these variables, then you must validate them inside the script. It's pretty easy, read the bottom of the script for more details.

# Salt

## Targets

Some states will only every run on specific targets:
- **dom0**: applies only to dom0 -- typically Qubes packages that have no place in VMs;
- **templatevm**: applies only to a TemplateVM -- typically this means it doesn't make sense for dom0 (e.g. networking tools), and also makes changes to the rootfs (e.g. /etc);
these won't work when applied to a template, so you must apply them to an AppVM only;
 - **admin**: any non-AppVM (e.g. dom0; TemplatVM) -- these are generic configurations that require write access to the rootfs, but are also safe to apply to dom0. For example: installing vim, or exa;
- **guest**: any AppVM -- which typically means that it makes changes to `/home/user`, or `/rw`. Since

A typical top will look like:
```yaml
user:
  dom0:
    - states.baz.foo.dom0         # probably a dom0 Qubes package
    - states.foobar.foo.admin     # applies to any privileged domain
  {{ pillar.template }}:          # a TemplateVM name
    - states.foo.bar.admin        # probably makes changes to `/etc`
    - states.foobar.foo.admin     # already applied to dom0 too
    - states.foo.bar.templatevm   # should apply only to a template
  {{ pillar.myappvm }}:
    - states.foo.bar.guest        # probably makes changes to `/rw` 
```

The reason it was done this way is because of the Qubes unique setup -- the view of a VM is divided into two: the AppVM and the TemplateVM. In a typical VM installation, this isn't the case, and it requires that a configuration is split between these two domains to achieve one result. One **caveat** is that it's not easy for `guest` states to invoke a dependency from an `admin` state, because that `admin` state be applied to the guest minion -- so you must manage these dependencies via a top.

## Hierarchy

The folder hierarchy has some meaning too: `states/category/type/target`:
- the `category` may also be a name (e.g. nvim, or exa), but sometimes `network` or `audio` -- which describes what the state is for;
- the `type` describes what the state does: `core` means it always applies, and the foundation for other types (i.e. it's a package installation, with a base config); `foo` or `bar` will describe what the state does;
- `target` is as described above: `admin`, `dom0`, `guest` etc. and describes what you can apply it to;

## Conclusion

In conclusion: states are named in such a way that describes which domain they apply to. You must be careful to ensure that `guest` states only form dependencies with other `guest` states, and the same for `admin`. Depending on the context, `admin` states can depend on `dom0` or `templatevm` states, and vice versa -- use some common sense. The folder hierarchy mostly follows the same convention, and makes memorising paths much easier.

In short: manually manage dependencies via tops, and be careful with inter-state dependencies. Stick to the prescribed convention for folder hierarchy when adding states.
