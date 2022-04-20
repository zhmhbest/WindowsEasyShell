import sys
import os
import hashlib

filename = sys.argv[1]

if not os.path.exists(filename):
    print("file does not exist!")
    sys.exit(1)

# 获取摘要
md5 = hashlib.md5()
with open(filename, "rb") as fd:
    md5.update(fd.read())
digest = md5.hexdigest()
print(digest)

# 验证摘要
if len(sys.argv) > 2:
    checkmd5 = sys.argv[2].lower()
    if checkmd5 == digest:
        print("Check: √")
    else:
        print("Check: ×")
