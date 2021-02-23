#!/usr/bin/env bash

# Shell 是一个应用程序，它连接了用户和 Linux 内核，让用户能够更加高效、安全、低成本地使用 Linux 内核，这就是 Shell 的本质。
# Shell 并不是内核的一部分，他跟普通的应用一样，只不过他有着特殊性，就是开机进入操作系统后立刻启动，用户便通过 Shell 来使用Linux。
# 大家所说的 Shell 强大，并不是 Shell 本身功能丰富，而是它擅长使用和组织其他的程序。Shell 就是一个领导者，这正是 Shell 的魅力所在。
# Shell 并不是简单的堆砌命令，我们还可以在 Shell 中编程，这和使用 C++、C#、Java、Python 等常见的编程语言并没有什么两样。
# Shell 就是一种脚本语言，我们编写完源码后不用编译，直接运行源码即可。

# 查看当前默认 SHELL 使用 $SHELL
echo "$SHELL"

# SHELL 命令的基本格式
# command [选项][参数] 其中 [] 表示可选的，可有可无。
# SHELL 的短格式选项和长格式选项，短格式使用 - 和一个字母表示，例如 ls -l，长格式用两个 -- 和一个单词表示，例如 ls --all

# read 用来读取用户输入，并把读取到的数据复制给一个变量。
# 使用 -r 支持反斜杠 -n 读取的长度
read -r input
echo "$input"

# SHELl 通过 PS1 和 PS2 这两个环境变量来控制提示符的格式。
# PS1 控制外层命令提示符格式。
# PS2 控制内层命令提示符格式。

# 写下第一行代码
echo "hello world!"

# 一个稍微复杂的代码
echo "input your name:"
read -r person
echo "hello $person~"

# $$ 获取当前进程的PID
echo $$

# source 命令，它会读取脚本文件中的代码，并依次执行所有语句。
# source 的用法，source filename 也可以简写成，. filename . 点的后面有个空格。

# Shell 四种运行方式
# 我们可以直接使用 Shell，也可以输入用户名和密码后再使用 Shell；第一种叫做非登录式，第二种叫做登录式。
# 我们可以在 Shell 中一个个地输入命令并及时查看它们的输出结果，整个过程都在跟 Shell 不停地互动，这叫做交互式。我们也可以运行一个 Shell 脚本文件，让所有命令批量化、一次性地执行，这叫做非交互式。
# 交互式的登录 Shell
# 交互式的非登录 Shell
# 非交互式的登录 Shell
# 非交互式的非登录 Shell

# 判断 Shell 是否是交互式
# 1、查看 $- 的值中是否含有i，如果有即是交互式。
echo "$-"
# 2、查看 PS1 的值，非空为交互式，否则为非交互式。
echo "$PS1"

# 判断 Shell 是否为登录式
# shopt login_shell 值为on表示为登录式，off为非登录式。
shopt login_shell

# 同时判断交互式、登录式
# 1、使用 PS1 和 shopt shell
echo "$PS1"
shopt login_shell
# 2、使用 $- 和 shopt shell
echo $-
shopt login_shell

# Shell配置文件（配置脚本）的加载
# 与 Bash Shell 有关的配置文件主要有 /etc/profile、~/.bash_profile、~/.bash_login、~/.profile、~/.bashrc、/etc/bashrc、/etc/profile.d/*.sh，不同的启动方式会加载不同的配置文件。
# ~表示用户主目录。*是通配符，/etc/profile.d/*.sh 表示 /etc/profile.d/ 目录下所有的脚本文件（以.sh结尾的文件）。

# 登录式的 Shell
# Bash 官方文档说：如果是登录式的 Shell，首先会读取和执行 /etc/profiles，这是所有用户的全局配置文件，接着会到用户主目录中寻找 ~/.bash_profile、~/.bash_login 或者 ~/.profile，它们都是用户个人的配置文件。
# 它们的优先级顺序是 ~/.bash_profile > ~/.bash_login > ~/.profile。

# 非登录的 Shell
# 如果以非登录的方式启动 Shell，那么就不会读取以上所说的配置文件，而是直接读取 ~/.bashrc。

# 如何编写自己的Shell配置文件（配置脚本）？
# 实例1：给 PATH 变量增加新的路径
# PATH=$PATH:$ANOTHER_PATH

# 实例2：修改命令提示符的格式
# PS1="[apple]>> "

# $- 中包含 i 则认为是交互式的 或 $PS1 不为空 也认为是交互式的
# shopt login_shell 输出为on 为登录时 off 为非登录式
