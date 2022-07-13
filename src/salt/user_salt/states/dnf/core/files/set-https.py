#!/usr/bin/env python3
from genericpath import isdir
from os import chdir
from glob import glob
from re import sub
from sys import argv

try:
    CWD = argv[1]
except IndexError:
    CWD = "/etc/yum.repos.d"

if not isdir(CWD):
    raise FileNotFoundError("The target directory must exist in the file system: " + CWD)

# match lines that start with metalink (commented or not) and that don't have protocol=https
#
# Also ignore qubes-os.org since it doesn't support setting the protocol. Typically you could
# ignore that fact, but the Regex is trickier to apply since the qubes URLs don't have any
# GET parameters (meaning applying the protocol would have to consider a '?').
PAT = r'^([# ]*metalink=(?!.*qubes-os\.org)(?!.+[?&]protocol=https).+)$'

chdir(CWD)

files = glob('*.repo') + glob('*.repo.rpmnew')

for f in files:
    with open(f, 'r') as file:
        changes = [sub(PAT, r'\1&protocol=https', line.strip()) for line in file]
    with open(f, 'w') as file:
        file.write('\n'.join(changes))
