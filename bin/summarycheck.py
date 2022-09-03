import sys
import os
import hashlib

if 1 == len(sys.argv):
    print("summaryfile <file>")
    sys.exit(1)

filename = sys.argv[1]
filesize = -1
buffersize = 1024 * 1024 * 8 # 8M

if not os.path.exists(filename):
    print("file does not exist!")
    sys.exit(1)
if not os.path.exists(f"{filename}.summary"):
    print("summary file does not exist!")
    sys.exit(1)

summary = {}

# 读取摘要
with open(f"{filename}.summary", "r") as fd:
    lines = fd.readlines()
    for line in lines:
        args = line.rstrip().split(" ")
        summary[args[0]] = args[1]
# print(summary)

# 计算摘要
md5 = hashlib.md5()
sha1 = hashlib.sha1()
sha2_256 = hashlib.sha256()
sha2_512 = hashlib.sha512()
sha3_512 = hashlib.sha3_512()

with open(filename, "rb") as fd:
    fd.seek(0, 2) # 移动到末尾
    filesize = fd.tell()
    fd.seek(0, 0) # 移动到开头
    print(f"filename = {filename}")
    print(f"filesize = {filesize}")

    readedsize = 0
    for i in range(0, filesize, buffersize):
        data: bytes = fd.read(buffersize)
        readedsize += len(data)
        md5.update(data)
        sha1.update(data)
        sha2_256.update(data)
        sha2_512.update(data)
        sha3_512.update(data)
        print(f"{filename} {round(100 * (readedsize / filesize), 2)}%")

hex_md5 = md5.hexdigest()
hex_sha1 = sha1.hexdigest()
hex_sha2_256 = sha2_256.hexdigest()
hex_sha2_512 = sha2_512.hexdigest()
hex_sha3_512 = sha3_512.hexdigest()

if (summary["md5"] == hex_md5 ):
    print("md5 Check: √")
else:
    print("md5 Check: ×")

if (summary["sha1"] == hex_sha1 ):
    print("sha1 Check: √")
else:
    print("sha1 Check: ×")

if (summary["sha256"] == hex_sha2_256 ):
    print("sha256 Check: √")
else:
    print("sha256 Check: ×")

if (summary["sha512"] == hex_sha2_512 ):
    print("sha512 Check: √")
else:
    print("sha512 Check: ×")

if (summary["sha3-512"] == hex_sha3_512 ):
    print("sha3-512 Check: √")
else:
    print("sha3-512 Check: ×")
