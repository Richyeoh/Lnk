## 与文件检测相关的 test 选项

### 文件类型判断
| 选项 | 作用 |
|:---:|:---:|
|-b filename|判断文件是否存在，并且是否为块设备文件|
|-c filename|判断文件是否存在，并且是否为字符设备文件|
|-d filename|判断文件是否存在，并且是否为目录文件|
|-e filename|判断文件是否存在|
|-f filename|判断文件是否存在，井且是否为普通文件|
|-L filename|判断文件是否存在，并且是否为符号链接文件|
|-p filename|判断文件是否存在，并且是否为管道文件|
|-s filename|判断文件是否存在，并且是否为非空|
|-S filename|判断该文件是否存在，并且是否为套接字文件|

### 文件权限判断
| 选项 | 作用 |
|:---:|:---:|
|-r filename|判断文件是否存在，并且是否拥有读权限|
|-w filename|判断文件是否存在，并且是否拥有写权限|
|-x filename|判断文件是否存在，并且是否拥有执行权限|
|-u filename|判断文件是否存在，并且是否拥有 SUID 权限|
|-g filename|判断文件是否存在，并且是否拥有 SGID 权限|
|-k filename|判断该文件是否存在，并且是否拥有 SBIT 权限|

### 文件比较判断
| 选项 | 作用 |
|:---:|:---:|
|filename1 -nt filename2|判断 filename1 的修改时间是否比 filename2 的新|
|filename -ot filename2|判断 filename1 的修改时间是否比 filename2 的旧|
|filename1 -ef filename2|判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法|

## 与数值比较相关的 test 选项
| 选项 | 作用 |
|:---:|:---:|
|num1 -eq num2|判断 num1 是否和 num2 相等|
|num1 -ne num2|判断 num1 是否和 num2 不相等|
|num1 -gt num2|判断 num1 是否大于 num2|
|num1 -lt num2|判断 num1 是否小于 num2|
|num1 -ge num2|判断 num1 是否大于等于 num2|
|num1 -le num2|判断 num1 是否小于等于 num2|

## 与字符串判断相关的 test 选项
| 选项 | 作用 |
|:---:|:---:|
|-z str|判断字符串 str 是否为空|
|-n str|判断宇符串 str 是否为非空|
|str1 = str2 或 str1 == str2|=和==是等价的，都用来判断 str1 是否和 str2 相等。|
|str1 != str2|判断 str1 是否和 str2 不相等|
|str1 \> str2|判断 str1 是否大于 str2。\\>是>的转义字符，这样写是为了防止>被误认为成重定向运算符|
|str1 \< str2|判断 str1 是否小于 str2。同样，\\<也是转义字符|

## 与逻辑运算相关的 test 选项
| 选项 | 作用 |
|:---:|:---:|
|expression1 -a expression|逻辑与，表达式 expression1 和 expression2 都成立，最终的结果才是成立的|
|expression1 -o expression2|逻辑或，表达式 expression1 和 expression2 有一个成立，最终的结果就成立|
|!expression|逻辑非，对 expression 进行取反|
