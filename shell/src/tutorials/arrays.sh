#!/usr/bin/env bash

# SHELL 数组
# 和其他编程语言一样，Shell 也支持数组，且没有限制数组的大小，理论上可以存放无限量的数据。
# 常用的 Bash Shell 只支持一维数组，不支持多维数组。

# SHELl 数组的定义
# 在 SHELL 中用() 来表示数组，数组元素之间使用空格来分割。
# array_name=(e1 e2 e3 ... en)

team_number=(pony jack rich)

# SHELL 数组是一个弱类型，他并不要求元素是否相同。
arrays=(20 21 年 2 月 22 日)

# SHELl的数组长度不固定，定义之后还可以增加元素。
team_number[3]="bill"

# SHEL支持给特定下表元素赋值
number=([1]=2 [2]=4)
echo "${number[@]}"

# 获取数组元素 ${array_name[index]}
num=${number[2]} # empty 因为0号元素是空的。
echo ${num}

# 使用*或@获取所有的元素
# ${array_name[*]} 或 ${array_name[@]}
echo ${number[*]}
echo ${number[@]}

# 获取数组的长度 ${#array_name[*]} or ${#array_name[@]}
echo size=${#number[*]}

# SHELL 数组拼接 array_new=(${array1[*]}  ${array2[*]}) 或 array_new=(${array1[@]}  ${array2[@]})
# 拼接数组的思路是：先利用@或*，将数组扩展成列表，然后再合并到一起。
array_1=(1 3 5)
array_2=(7 9 11)
array_3=(${array_1[*]} ${array_2[*]})
echo ${array_3[*]}

array_1=(1 3 5)
array_2=(7 9 11)
array_3=(${array_1[@]} ${array_2[@]})
echo ${array_3[@]}

# SHELL 删除数组元素（也可以删除整个数组）
# 和删除变量一样，使用unset命令
# unset array[index] 删除一个变量
# unset array[*] 删除整个
# unset array[@] 删除整个

unset array_3[0] # 删除第0个元素
echo ${array_3[*]}

unset array_3[@]   # 删除整个数组
echo ${array_3[@]} #输出空

# SHEL 关联数组
# 所谓的关联数组，类似于Python中的字典，Java中的MAP。
# 使用 declare -a 创建关联数组
# 例子：
declare -a colors
colors["red"]="#ff0000"
colors["green"]="#00ff00"
colors["blue"]="#0000ff"
# 也可以一行定义
# declare -a color2=(["red"]="#ff0000", ["green"]="#00ff00", ["blue"]="#0000ff")

# 访问关联数组元素
# 和普通数组几乎相同，形式如下 $(array_name["index"])
#echo $(colors["red"])
#echo $(colors["blue"])

# 追加关联数组元素
# 和普通数组几乎相同，形式如下 array_name["index"]
color["white"]="#ffffff"
color["black"]="#000000"

# 获取相关联数组的下表和值
# 获取下标 key
# ${!array_name[@]}
# ${!array_name[*]}

for key in "${!colors[@]}"
do
  echo key=$key
done

# 获取元素 value
# ${array_name[@]}
# ${array_name[*]}
echo ${colors[*]}

# 获取关联数组长度
# ${#array_name[*]}
# ${#array_name[@]}
echo ${#colors[@]}
