function doit() {
    sed -i 's/\r//g' "$1"
}

IFS=`echo -en "\n\b"`
basepath="."; for i in `ls -R`; do
    if [ "${i:(-1)}" = ":" ]; then
        basepath="${i::(-1)}"
    else
        basename="$i"
        filename="$basepath/$i"
        extname="${filename##*.}"
        if [ ! -f "$filename" ]; then continue; fi
        if [[
               "$basepath" =~ \/target\/
            || "$basepath" =~ \/out\/
            || "$basepath" =~ \/dump\/
            || "$basepath" =~ \/__pycache__
            || "$basepath" =~ \/build\/
            || "$basepath" =~ \/classes\/
        ]]; then
            echo "[□] $basename"
            continue
        fi

        case $extname in
            'zip'|'7z'|'tar'|'bz'|'gz'|'war'|'jar'|'class'|'original')
                # Nothing
                echo "[×] $basename"
                ;;
            'jpg'|'jpeg'|'png'|'bmp'|'psd')
                # Nothing
                echo "[×] $basename"
                ;;
            'pdf'|'doc'|'docx'|'xls'|'xlsx'|'ppt'|'pptx')
                # Nothing
                echo "[×] $basename"
                ;;
            'pyc'|'whl')
                # Nothing
                echo "[×] $basename"
                ;;
            *)
                echo "[√] $basename"
                doit "$filename"
                ;;
        esac
    fi
done
