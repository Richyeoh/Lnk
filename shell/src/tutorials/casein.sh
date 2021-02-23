#!/usr/bin/env bash
# case in
# case in 用法，case in 支持简单的正则表达式
# * 任意字符
# [abc] a b c 三个字符中的任意一种
# [a-z] 从 a-z中的任意字符
# ｜ 多重选择，类似于或的逻辑运算
# 例子

read -r input

case $input in
[a-zA-Z])
  printf "letter\n"
  ;;
[0-9])
  printf "digit\n"
  ;;
*)
  printf "输入参数不合法\n"
  ;;
esac
