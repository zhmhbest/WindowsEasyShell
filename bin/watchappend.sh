filename="$1"
# stat -c <format> <file>
# %y   time of last data modification, human-readable
# %Y   time of last data modification, seconds since Epoch
# %s   block size (for faster transfers)
last_mod=0
last_len=0

while true; do
    readarray -d ',' -t filestat <<<$(stat -c '%Y,%s' "$filename")
    current_mod=${filestat[0]}
    current_len=${filestat[1]}
    if (($last_mod != $current_mod)); then
        ((append_len=$current_len-$last_len))
        # echo "change: $current_mod", $append_len"
        if (($append_len > 0)); then
            # 文件已经追加内容
            tail -c"$append_len" "$filename"
        fi
        last_mod=$current_mod
        last_len=$current_len
    fi
    sleep 1;
done
