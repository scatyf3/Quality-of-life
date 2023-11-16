#!/bin/bash

# 提示用户输入数字
read -p "请输入一个数字: " number

# 创建 lab<数字> 文件夹并复制文件
folder_name="lab$number"
mkdir -p "export/$folder_name/src"

# 拷贝 常见源代码文件到目标目录
find "$folder_name/src/"* -type f -name f \( -name "*.c" -o -name "*.cpp" -o -name "*.py" -o -name "*.sh" -o -name "Makefile" -o -name "*.ipynb" \) -exec cp {} "export/$folder_name/src/" \;

cp "$folder_name/lab_report.md" "export/$folder_name"
cp "$folder_name/lab_report.md" "export/$folder_name"
cp "merge.py" "export/$folder_name"
cp "cover.docx" "export/$folder_name"

# 切换到 export/lab<数字> 目录
cd "export/$folder_name" || exit

# 运行 pandoc 命令将 lab_report.md 转换为 lab_report.docx
pandoc "lab_report.md" -o "lab_report.docx"

python3 merge.py
python_pid=$!
wait $python_pid

rm merge.py
rm lab_report.docx
rm cover.docx
rm modified_cover.docx
rm modified_cover.pdf
mv merged.pdf lab_report.pdf
mv lab_report.md lab_report_source.md

# 根据操作系统类型选择不同的命令来创建ZIP文件
if [[ "$OSTYPE" == "darwin"* ]]; then
    zip -r "$folder_name.zip" .
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    powershell -Command "Compress-Archive -Path '.' -DestinationPath '$folder_name.zip' -Force"
else
    echo "不支持的操作系统类型"
    exit 1
fi
# 将eencoded_string中的内容更改为你的名字+学号
encoded_string="1145141919810 李田所 实验$number"
mv "$folder_name.zip" "$encoded_string.zip"

echo "操作完成"