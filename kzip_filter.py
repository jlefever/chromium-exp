import glob
import json
import subprocess as sp
from pathlib import Path


KZIP_DIR = Path("/media/sixtb/school/research/KytheOutputF3")
KZIP_TOOL_PATH = Path("/opt/kythe/tools/kzip")
# SEARCH_STR = "chrome/browser/devtools"
    

for filename in sorted(glob.glob(str(KZIP_DIR / "*.kzip"))):
    res = sp.run([KZIP_TOOL_PATH, "view", filename], capture_output=True, text=True)
    obj = json.loads(res.stdout)
    print("{}\t{}".format(filename, "\t".join(obj["source_file"])))
    
    # print("{}: {}: {}".format(filename, res.stdout[0:20], SEARCH_STR in res.stdout))
    # if SEARCH_STR in res.stdout:
    #     print(filename)