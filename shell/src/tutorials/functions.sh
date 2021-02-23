#!/usr/bin/env bash

# 函数
# 函数的语法格式如下：
# function name() {
#    statements
#    [return value]
# }

# 函数定义的简化写法
# name() {
#    statements
#    [return value]
# }

# 如果使用了function关键字，()也可省略
# function name {
#    statements
#    [return value]
# }

# 函数调用 直接给出名字几个
# 如果传递参数，那么多个参数之间以空格分隔
# fun p1 p2 p3

function url() {
  echo "github.com"
}

url

function add() {
  result=$(($1 + $2))
}

add 1 2
echo $result

# 但是 Shell 中的返回值表示的是函数的退出状态：返回值为 0 表示函数执行成功了，返回值为非 0 表示函数执行失败（出错）了。if、while、for 等语句都是根据函数的退出状态来判断条件是否成立。
# Shell 函数的返回值只能是一个介于 0~255 之间的整数，其中只有 0 表示成功，其它值都表示失败。
# 如果函数体中没有 return 语句，那么使用默认的退出状态，也就是最后一条命令的退出状态。如果这就是你想要的，那么更加严谨的写法为：return $?

# 如何得到函数的处理结果？
# 既然 return 表示退出状态，那么该如何得到函数的处理结果呢？比如，我定义了一个函数，计算从 m 加到 n 的和，最终得到的结果该如何返回呢？
# 这个问题有两种解决方案：
# 一种是借助全局变量，将得到的结果赋值给全局变量；
# 一种是在函数内部使用 echo、printf 命令将结果输出，在函数外部使用$()或者``捕获结果。
# 第一种
sum=0
function getsum() {
  for ((i = $1; i <= $2; i++)); do
    ((sum += i)) #改变全局变量
  done
  return $? #返回上一条命令的退出状态
}

read x
read y
if getsum $m $n; then
  echo "The sum is $sum"
else
  echo "error"
fi
# 这种方案的弊端是：定义函数的同时还得额外定义一个全局变量，如果我们仅仅知道函数的名字，但是不知道全局变量的名字，那么也是无法获取结果的。

# 第二种方案

function getsum() {
  local sum=0 #局部变量
  for ((i = $1; i <= $2; i++)); do
    ((sum += i))
  done

  echo $sum
  return $?
}
read m
read n
total=$(getsum $m $n)
echo "The sum is $total"
