# Quality-of-life
一些能提高做作业生活质量的配置文件和自动化工具😄

## 使用方法

第一步，克隆本仓库

```sh
git clone https://github.com/scatyf3/Quality-of-life.git
```
其次，安装依赖pandoc

```sh
scoop install pandoc #windows
brew install pandoc #macos
sudo apt-get install pandoc #linux
```

将release.zip复制到你的工作目录

运行指令

```sh
unzip release.zip
```

当你要建立一个工作目录之前，运行
```sh
sh build.sh
```

某份作业完成之后，运行

```sh
sh warp.sh
```

## 使用效果

### build

`build.sh`可以创建出如下文件

```
.
├── build_project.sh
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

### warp

warp文件需要你手动输入数字，并且更改sh里的`encoded_string`为你的姓名学号。

它从命令行中读取一个数字，然后:
* 将对应的`lab<数字>/src`文件夹中的常见源代码(.c .cpp .java .py Makefile)拷贝到`export/lab<数字>/src`
* 将`lab<数字>`文件夹中的`lab_report.md`拷贝到`export/lab<数字>`文件夹下，利用pandoc转化为docx
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


