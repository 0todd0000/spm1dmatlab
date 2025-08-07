
import os, pathlib
import datetime


version_str  = 'M.0.4.51'







dirREPO      = pathlib.Path( __file__ ).parent.parent
date_str     = str( datetime.date.today() )



# # update VERSION.txt
# fpathVERSION = os.path.join(dirREPO, 'VERSION.txt')
# with open(fpathVERSION, 'w') as f:
#     f.writelines( [f'spm1d version {version_str} ({date_str})'] )



# update version.m
fpath = os.path.join(dirREPO, '+spm1d', 'version.m')
with open(fpath, 'r') as f:
    lines = f.readlines()
    for i,line in enumerate(lines):
        if line.startswith("    v = '"):
            break
    lines[i] = f"    v = '{version_str}';\n"
with open(fpath, 'w') as f:
    f.writelines( lines )




# # update README.md
# fpath = os.path.join(dirREPO, 'README.md')
# with open(fpath, 'r') as f:
#     lines = f.readlines()
#     for i,line in enumerate(lines):
#         if line.startswith('![Version]'):
#             break
#     lines[i] = f"![version](https://img.shields.io/badge/version-{version_str}-blue)\n"
# with open(fpath, 'w') as f:
#     f.writelines( lines )

