#!/usr/bin/env bash

# 在 SHELL 中每一个变量的值都是字符串，无论你给变量赋值时有没有使用引号，值都会以字符串的形式存储。

# SHELL 的三种定义方式。
variable=value
variable='value'
variable="value"

# variable 是变量名，value 是赋给变量的值。如果 value 不包含任何空白符（例如空格、Tab 缩进等），那么可以不使用引号.
# 如果 value 包含了空白符，那么就必须使用引号包围起来。使用单引号和使用双引号也是有区别的，稍后我们会详细说明。

# 注意，赋值号 = 的周围不能有空格，这可能和你熟悉的大部分编程语言都不一样。

# 例子:
url=https://lnk.richyeoh.com

# 使用变量
# 只要在变量名前面加美元符号$即可。
echo $url

# 变量名外面的花括号{ }是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界。
# 推荐给所有变量加上花括号{ }，这是个良好的编程习惯。
# 例如：
skill=Java
echo "I am good at ${skill} script"

# 修改变量的值
# 第二次对变量赋值时不能在变量名前加$，只有在使用变量时才能加$。
skill=Python
echo "I am good at ${skill} script"

# 单引号和双引号
# 双引号，输出时会先解析里面的变量和命令。单引号，里面是什么就输出什么，即使内容中有变量和命令，也会原样输出。
# 例子：
website1=richyeoh.com
website2=lnk.richyeoh.com
echo '$website1'
echo "$website2"
# 个人建议：
# 如果变量的内容是数字，那么可以不加引号。
# 如果真的需要原样输出就加单引号。
# 其他没有特别要求的字符串等最好都加上双引号，定义变量时加双引号是最常见的使用场景。

# 将命令结果赋值给变量
# variable=`command` 第一种方式把命令用反引号` `（位于 Esc 键的下方）包围起来，反引号和单引号非常相似，容易产生混淆，所以不推荐使用这种方式。
# variable=$(command) 第二种方式把命令用$()包围起来，区分更加明显，所以推荐使用这种方式。

ls_all=$(ls -a)
echo $ls_all

ls_all=$(ls -a)
echo $ls_all

# 只读变量
# 使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
name="richyeoh"
readonly name
name="jack ma" # read-only variable: name

# 删除变量
# unset variable
unset name
echo $name # 没有任何输出
