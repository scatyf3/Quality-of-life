# Quality-of-life
一些能提高做作业生活质量的配置文件和自动化工具😄

## 使用方法

第一步，克隆本仓库

```sh
git clone https://github.com/scatyf3/Quality-of-life.git
```

其次，将release.zip复制到你的工作目录

最后运行指令

```sh
unzip release.zip
sh build.sh
```

## 使用效果

可以创建出如下文件

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


