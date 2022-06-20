The `prepare.sh` script is for Qubes only. It will modify files on the root file system -- which is protected by COW under Qubes. This script allows you to quickly symlink local files to system files. It does so by backing up the target, and replacing it with a symlink to the local repo files.

```bash
./prepare.sh kitty kitty.conf diff.conf
```

The first argument is a directory name within the repo, which contains files. The remaining arguments are those file names. You must set the appropriate paths in `.env` for it to work. If you intend to extend these variables, then you must validate them inside the script. It's pretty easy, read the bottom of the script for more details.
