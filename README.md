![上这个学校上的](src/icon.jpg)

# Quality-of-life
一些能提高做作业生活质量的配置文件和自动化工具😄

## 使用方法

### 克隆源码

第一步，克隆本仓库

```sh
git clone https://github.com/scatyf3/Quality-of-life.git
```

### 安装依赖项

首先，作为一个成熟的计算机学生，我们默认你有python和pip，另外也默认你的电脑中有（无论如何激活的）正版docx

其次，安装文档转换工具pandoc

```sh
scoop install pandoc #windows
brew install pandoc #macos
sudo apt-get install pandoc #linux
```

安装pip依赖项

```sh
pip3 install -r requirement.txt
```

修改脚本项warp.sh，定义为个人姓名
```sh
encoded_string="1145141919810 李田所 实验$number"
```

修改脚本项merge.py，定义为个人姓名
```py
# Update line with custom string
custom_string = "Your Custom String" #在这里输入你的姓名学号
doc.paragraphs[0].text = custom_string
```

### 使用

将`src`文件夹的全部代码复制到你的工作目录

运行如下代码建立工作区文件夹，和命令行交互建立某次lab的文件夹
```sh
sh build.sh
```

作业完成之后，运行如下代码，和命令行交互打包某次lab的文件夹

```sh
sh warp.sh
```

## 使用效果

### build

拷贝src和运行`build.sh`后，我们得到结构类似如下的文件夹

```
.
├── build.sh
├── warp.sh
├── merge.py
├── icon.jpg
├── requirement.txt
├── .gitignore
├── example
├── export
├── lab1
│   ├── asserts
│   ├── docs
│   ├── lab_report.md
│   └── src
└── lab_report.md

```

其中lab_report.md模版如下:


```
# 实验内容

# 实验过程

## 1

## 2

## 3

# 实验代码

# 实验结果

# 实验反思
```

这样，你就可以在你喜欢的并且优美简洁的markdown编辑器中写实验报告了🎉

### warp

warp文件需要你手动输入数字，并且更改sh里的`encoded_string`为你的姓名学号。

它从命令行中读取一个数字，然后:
* 将对应的`lab<数字>/src`文件夹中的常见源代码(.c .cpp .java .py Makefile)拷贝到`export/lab<数字>/src`
* 将`lab<数字>`文件夹中的`lab_report.md`拷贝到`export/lab<数字>`文件夹下，利用pandoc转化为docx
* 编辑cover，在其中加入系统时间，然后把cover.docx和lab_report.docx分别转化为pdf，并合并两者，把合并的pdf重命名为lab_report.pdf，把md重命名为`lab_report_source.md`
* 压缩`export/lab<数字>`中的内容，将压缩包重命名为`encoded_string`


## 说明
这个文件目录仅仅是个人的使用习惯

* example: 一些示例代码，便于理解要求编写的某函数，在gitignore里忽略
* export: 最终提交的zip，由于含有真名，在gitignore里忽略
* lab<number>: 第x次实验的文件
    * src: 源代码
    * docs: 文档，包含老师发送的要求，教程，自己查询的手册，理论上应该忽略，但是笔者暂时不会
    * assert: 编写markdown报告的图床，理论上应该忽略，但是笔者也暂时不会
        * 其实感觉图片直接base64硬编码在md里更好，但是仍然不会 
    * lab_report.md: 实验结果报告


