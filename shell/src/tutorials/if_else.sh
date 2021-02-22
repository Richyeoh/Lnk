#!/usr/bin/env bash

# if else语句
# 语法格式：
# if  condition
# then
#    statement(s)
# fi
# 注意，最后必须以fi来闭合，fi 就是 if 倒过来拼写。也正是有了 fi 来结尾，所以即使有多条语句也不需要用{ }包围起来。
# 当 if 和 then 位于同一行的时候，必须要加；分号，否则会有语法错误。
# 例子
read a
read b
if ((a == b)); then
  echo a and b equals.
else
  echo a and b not equals.
fi

# if elif else 语句
# elif 后续要跟 then
if ((a > b)); then
  echo "a > b"
elif ((a < b)); then
  echo "a < b"
else
  echo "a = b"
fi
