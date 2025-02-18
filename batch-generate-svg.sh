#!/usr/bin/env bash

# pnpm start

mkdir -p temp
rm -rf temp/*
output_file=temp/temp.svg

for i in {1..100}
do
    #echo "Welcome $i times"

    curl -s -o "$output_file" "http://localhost:3000/api/face?w=200&h=200"
    # 检查 curl 是否成功执行
    if [ $? -eq 0 ]; then
        #echo "成功获取 URL 内容并保存到 $output_file"

        # 使用 cat 命令显示文件内容
        #cat "$output_file"
        cheksum=$(cat $output_file | md5)
        #echo ${cheksum}
        mkdir -p temp/${cheksum:0:2}
        mv $output_file temp/${cheksum:0:2}/$cheksum.svg
    else
        echo "获取 URL 内容时出现错误"
    fi

done
