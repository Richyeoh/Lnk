#!/usr/bin/env bash
# while

read x
read y

while ((x <= y)); do
  ((sum+=x))
  ((x++))
done

echo $sum
