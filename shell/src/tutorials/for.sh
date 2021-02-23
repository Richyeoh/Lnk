#!/usr/bin/env bash

# for 的风格有很多种
# 一种c风格和python风格
# c风格
n=100
for ((i = 0; i <= n; i++)); do
  ((sum += i))
done

echo $sum

# python风格
for x in a b c d e; do
  echo $x
done

for c in $(seq 0 255); do
  printf "%d " $c
done
