#!/usr/bin/env bash

# 退出状态
# 每一条 Shell 命令，不管是 Bash 内置命令（例如 cd、echo），还是外部的 Linux 命令（例如 ls、awk），还是自定义的 Shell 函数，当它退出（运行结束）时，都会返回一个比较小的整数值给调用（使用）它的程序，这就是命令的退出状态（exit statu）。
# if 语句的判断条件，从本质上讲，判断的就是命令的退出状态。
# 按照惯例来说，退出状态为 0 表示“成功”；也就是说，程序执行完成并且没有遇到任何问题。除 0 以外的其它任何退出状态都为“失败”。

read a
read b
((a==b))
echo $?

if "0" && "1";then
  echo "aaa"
esle
  echo "bbb"
fi
