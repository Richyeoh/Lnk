#!/usr/bin/env bash

# 字符串（String）就是一系列字符的组合。字符串是 Shell 编程中最常用的数据类型之一（似乎除了数字和字符串，也没有其他类型了）。
# 字符串可以由单引号' '包围，也可以由双引号" "包围，也可以不用引号。它们之间是有区别的。

# 不被引号包围的字符串
# 不被引号包围的字符串中出现变量时也会被解析，这一点和双引号" "包围的字符串一样。
# 字符串中不能出现空格，否则空格后边的字符串会作为其他变量或者命令解析。
str1=www.richyeoh.com
# 由单引号' '包围的字符串：
# 任何字符都会原样输出，在其中使用变量是无效的。
# 字符串中不能出现单引号，即使对单引号进行转义也不行。
str2='www.richyeoh.com'
# 双引号" "包围的字符串：
# 如果其中包含了某个变量，那么该变量会被解析（得到该变量的值），而不是原样输出。
# 字符串中可以出现双引号，只要它被转义了就行。
str3="www.richyeoh.com"

num=1
str4=richyeoh.com$num str5="shell \"script\" $num"
str6='richyeoh.com$sum'
echo $str4
echo $str5
echo $str6

# 获取字符串长度
# ${#str}
echo ${#str6}

# 字符串拼接
# 在SHELL中不需要任何的运算符，将两个字符串并排排放一起就能实现拼接。
first_name='rich'
last_name='yeoh'
full_name=$first_name$last_name #中间不能有空格
echo $full_name

full_name="${first_name} ${last_name}" #可以有空格
echo $full_name

# 字符串截取
# SHELL 截取字符串通常有两种方式，从指定位置开始截取和从指定字符（子字符串）开始截取。

# 从指定位置开始截取
# 1) 从字符串左边开始计数，格式如下${string: start :length}
name="杨明明"
echo $name
first_name=${name:0:1}
echo firstname:$first_name
# 2) 从右边开始计数，格式如下${string: 0-start :length} 0-这种属于固定写法，专门用来表示从字符串右边开始计数。
last_name=${name:0-2:3}
echo lastname:$last_name
# 计数方向不同，起始数字也不同。
# 从左边开始计数时，起始数字是 0（这符合程序员思维）。
# 从右边开始计数时，起始数字是 1（这符合常人思维）。
# 省略 length，直接截取到字符串末尾

# 从指定字符（子字符串）开始截取
str="abcdefghijklmnopqrstuvwxyz"
# 1) 使用 # 号截取右边字符，格式如下：${string#*chars}
# 其中，string 表示要截取的字符，chars 是指定的字符（或者子字符串），*是通配符的一种，表示任意长度的字符串。*chars连起来使用的意思是：忽略左边的所有字符，直到遇见 chars（chars 不会被截取）。
echo "${str#*c}" #截取c之后的字符
echo "${str#abc}" #截取c之后的字符
# 如果希望直到最后一个指定字符（子字符串）再匹配结束，那么可以使用##
str="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
echo "${str##*abc}" #需要加*通配符，否则还是截取最先出现的

# 2) 使用 % 截取左边字符，格式如下：${string%chars*}
# 请注意*的位置，因为要截取 chars 左边的字符，而忽略 chars 右边的字符，所以*应该位于 chars 的右侧。其他方面%和#的用法相同。
echo "${str%a*}"
echo "${str%%a*}"
