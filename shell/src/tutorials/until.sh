#!/usr/bin/env bash

# until 先对 condition 进行判断，如果该条件不成立，就进入循环，执行 until 循环体中的语句（do 和 done 之间的语句），这样就完成了一次循环。
# while是条件成立进入循环，until则是条件不成立进入循环
i=0
until ((i>100)); do
  ((sum+=i))
  ((i++))
  echo $sum
done
