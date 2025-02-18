#!/usr/bin/env bash

#!/bin/bash

# 定义要列举文件的文件夹路径
folder_path="png"

rm -f  filelist-png.txt

# 遍历文件夹内的所有文件
for folder in "$folder_path"/*; do
    if [ -d "$folder" ]; then
        # 打印文件名
        #echo "$(basename "$folder")" $folder
        for file in "$folder"/*; do
            if [ -e "$file" ] && [[ $file == *.png ]]; then
                # 打印文件名
                #echo "$(basename "$file")" $file
                echo $file >> filelist-png.txt
            fi
        done
    fi
done
