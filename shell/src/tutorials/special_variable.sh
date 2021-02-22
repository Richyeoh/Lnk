#!/usr/bin/env bash

# 特殊变量
# 给脚本传递参数
echo "Process PID: $$" #当前进程 PID
echo "File name: $0"   #脚本名称
echo "First param:$1"  #第一个参数
echo "Second param:$2" #第二个参数
echo "All params 1:$*" #全部参数，如果使用""包围，将所有参数都当作一个整体。
echo "All params 2:$@" #全部参数，如果使用""包围，每个参数都是独立的。

function params() {
  echo "Process PID: $$" #当前进程 PID
  echo "File name: $0"   #脚本名称
  echo "First param:$1"  #第一个参数
  echo "Second param:$2" #第二个参数
  echo "All params 1:$*" #全部参数，如果使用""包围，将所有参数都当作一个整体。
  echo "All params 2:$@" #全部参数，如果使用""包围，每个参数都是独立的。
}

params p3 p4

# $* 和 $@ 的区别
# 当 $* 和 $@ 不被双引号" "包围时，它们之间没有任何区别，都是将接收到的每个参数看做一份数据，彼此之间以空格来分隔。
# 但是当它们被双引号" "包含时，就会有区别了。
# "$*"会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
# "$@"仍然将每个参数都看作一份数据，彼此之间是独立的。
# 直接说没有什么实际意义，直接使用for循环看一下得了。

for var in "$*"; do
  echo "\$*：$var"
done

for var in "$@"; do
  echo "\$@：$var"
done

# $?获取上一个命令的返回值，或退出状态
if [ "$1" == 0 ]; then
  exit 0
else
  exit 1
fi
# exit 退出当前shell。
# Shell 函数中的 return 关键字用来表示函数的退出状态，而不是函数的返回值；Shell 不像其它编程语言，没有专门处理返回值的关键字。
# return 的值不能大于255，0为正常，其他为异常。
