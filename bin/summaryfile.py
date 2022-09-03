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
print("md5      =", hex_md5)
print("sha1     =", hex_sha1)
print("sha2-256 =", hex_sha2_256)
print("sha2-512 =", hex_sha2_512)
print("sha3-512 =", hex_sha3_512)

with open(f"{filename}.summary", "w") as fd:
    fd.write(f"md5 {hex_md5}\n")
    fd.write(f"sha1 {hex_sha1}\n")
    fd.write(f"sha256 {hex_sha2_256}\n")
    fd.write(f"sha512 {hex_sha2_512}\n")
    fd.write(f"sha3-512 {hex_sha3_512}\n")
