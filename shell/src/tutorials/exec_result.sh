#!/usr/bin/env bash

# SHELL 命令替换：将命令的输出结果赋值给变量
# SHELL 命令替换是指将命令的输出结果赋值给某个变量。
# 例如，在某个目录中输入 ls 命令可查看当前目录中所有的文件，但如何将输出内容存入某个变量中呢？这就需要使用命令替换了。
# 中有两种方式可以完成命令替换，一种是反引号` `，一种是$()。
# variable=`commands`
# variable=$(commands)
# 其中，variable 是变量名，commands 是要执行的命令。
# commands 可以只有一个命令，也可以有多个命令，多个命令之间以分号 ; 分隔。
# 例子：
start_time=`date`
sleep 2s
end_time=$(date)

echo "start time:${start_time}"
echo "end time:${end_time}"

# 使用 date 命令的 %s 格式控制符，可以方便的获取UNIX时间戳。
start_time=`date +%s`
sleep 2s
end_time=$(date +%s)

run_time=$((end_time-start_time))s

echo "start time:${start_time}"
echo "end time:${end_time}"
echo "run time:${run_time}"

# (())是SHELL的数学计算命令，和其他编程语言不通过，SHELL中进行数据计算不是很方便，必须使用专门的数学计算命令，(())就是其中之一。

LSLA=$(ls -l)
echo $LSLA
# 注意，如果被替换的命令的输出内容包括多行（也即有换行符）或者含有多个连续的空白符，那么在输出变量时应该将变量用双引号包围。
# 否则系统会使用默认的空白符来填充，这可能会导致换行无效，以及连续的空白符被压缩成一个。

# $()和``
# $() 只在 Bash shell中有效，``可以在多个shell中使用，两者各有所长，各取所需。
