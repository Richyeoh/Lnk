#!/usr/bin/env bash

# 通常内建命令会比外部命令执行得更快，执行外部命令时不但会触发磁盘 I/O，还需要 fork 出一个单独的进程来执行，执行完成后再退出。
# 而执行内建命令相当于调用当前 Shell 进程的一个函数。

# 使用 type 来确定一个命令是否是内建命令
type cd
type ifconfig

# 设置别名
# 格式如下 alias new_name='command'
# 举个例子，设置快速关机
alias sdnn='shutdown -h now'
# 获取时间戳
alias tsp='date +%s'

ts=$(tsp)
echo ${ts}

# 删除别名
# 格式如下 unalias alias_name
unalias tsp

echo $(tsp)

# echo 命令
# -n 不换行，-e 支持转义字符 \转移字符
echo -n "abc"
echo -n "efg"
echo -e "\ni \nlove \nyou"

# read 命令
# -a array 把读取的数据赋值给数组 array，从下标 0 开始。
# -d delimiter 用字符串 delimiter 指定读取结束的位置，而不是一个换行符（读取到的数据不包括 delimiter）。
# -e 在获取用户输入的时候，对功能键进行编码转换，不会直接显式功能键对应的字符。
# -n num 读取 num 个字符，而不是整行字符。
# -p prompt 显示提示信息，提示内容为 prompt。
# -r 原样读取（Raw mode），不把反斜杠字符解释为转义字符。
# -s 静默模式（Silent mode），不会在屏幕上显示输入的字符。当输入密码和其它确认信息的时候，这是很有必要的。
# -t seconds 设置超时时间，单位为秒。如果用户没有在指定时间内输入完成，那么 read 将会返回一个非 0 的退出状态，表示读取失败。
# -u fd 使用文件描述符 fd 作为输入源，而不是标准输入，类似于重定向。

read -p "Enter some info:" name url age
echo $name
echo $url
echo $age

read -p "Input your name:" name
read -s -p "Input your password:" password

echo $name

echo $password

# exit命令：退出当前进程
# exit 命令可以接受一个整数值作为参数，代表退出状态。如果不指定，默认状态值是 0。
# exit 退出状态只能是一个介于 0~255 之间的整数，其中只有 0 表示成功，其它值都表示失败。

echo "exit before"
exit 8 #运行时，屏蔽这个命令，否则直接退出了，不会执行其他的命令了。
echo "exit after"

# declare 命令 格式如下：declare [+/-] [aAfFgilprtux] [变量名=变量值]
# 其中，-表示设置属性，+表示取消属性，aAfFgilprtux都是具体的选项
# -f [name] 列出之前由用户在脚本中定义的函数名称和函数体
# -F [name] 仅列出自定义函数名称
# -g name 在 Shell 函数内部创建全局变量
# -p [name] 显示指定变量的属性和值
# -a name 声明变量为普通数组
# -A name 声明变量为关联数组（支持索引下标为字符串）
# -i name  将变量定义为整数型
# -r name[=value] 将变量定义为只读（不可修改和删除），等价于 readonly name
# -x name[=value] 将变量设置为环境变量，等价于 export name[=value]

declare -i x y ret
x=20
y=30
ret=$x+$y
echo $ret
