# 1. Вывести на экран 3 раза имя пользователя, от которого запускается команда.

# Вывод с помощью цикла
# for i in {1..3};
#   do
#     whoami
#   done
ubuntu@ip-172-31-26-92:~$ for i in {1..3};
>   do
>     whoami
>   done
# ubuntu
# ubuntu
# ubuntu

# Вывод с помощью функции
# function who() {
# 	num=$1
# 	shift
# 	for i in $(seq $num);
# 	do
# 	$@
# 	done
# }
ubuntu@ip-172-31-26-92:~$ function who() {
> num=$1
> shift
> for i in $(seq $num);
> do
> $@
> done
> }
ubuntu@ip-172-31-26-92:~$ who 3 whoami
# ubuntu
# ubuntu
# ubuntu

# 2. Вывести с помощью цикла while все четные числа от 0 до 100 включительно.

# start=0
# while [ $start -lt 101 ]
# do
# echo $start
# start=$(( $start + 2 ))
# done
ubuntu@ip-172-31-26-92:~$ start=0
ubuntu@ip-172-31-26-92:~$ while [ $start -lt 101 ]
> do
> echo $start
> start=$(( $start + 2 ))
> done
# 0
# 2
# 4
# 6
# 8
# 10
# 12
# 14
# 16
# 18
# 20
# 22
# 24
# 26
# 28
# 30
# 32
# 34
# 36
# 38
# 40
# 42
# 44
# 46
# 48
# 50
# 52
# 54
# 56
# 58
# 60
# 62
# 64
# 66
# 68
# 70
# 72
# 74
# 76
# 78
# 80
# 82
# 84
# 86
# 88
# 90
# 92
# 94
# 96
# 98
# 100

# 3. Создать с помощью nano файл test.txt. Настроить автоматический бэкап этого файла раз в 10 минут 
# в файл с названием test.txt.bak с использованием cron.

ubuntu@ip-172-31-26-92:~$ cat > test.txt
# print('Hello')
# ^Z
# [1]+  Stopped                 cat > test.txt
ubuntu@ip-172-31-26-92:~$ cat test.txt
# print('Hello')
ubuntu@ip-172-31-26-92:~$ crontab -l
# no crontab for ubuntu
ubuntu@ip-172-31-26-92:~$ sudo crontab -i
# crontab: usage error: file name must be specified for replace
# usage:  crontab [-u user] file
#         crontab [ -u user ] [ -i ] { -e | -l | -r }
#                 (default operation is replace, per 1003.2)
#         -e      (edit user's crontab)
#         -l      (list user's crontab)
#         -r      (delete user's crontab)
#         -i      (prompt before deleting user's crontab)
ubuntu@ip-172-31-26-92:~$ cat > script.sh
# #!/bin/bash
# cp test.txt taest.txt.bak
# ^Z
# [5]+  Stopped                 cat > script.sh
ubuntu@ip-172-31-26-92:~$ cat script.sh
# #!/bin/bash
# cp test.txt taest.txt.bak
ubuntu@ip-172-31-26-92:~$ chmod u+x script.sh
ubuntu@ip-172-31-26-92:~$ crontab -e
# no crontab for ubuntu - using an empty one

# Select an editor.  To change later, run 'select-editor'.
#   1. /bin/nano        <---- easiest
#   2. /usr/bin/vim.basic
#   3. /usr/bin/vim.tiny
#   4. /bin/ed

# Choose 1-4 [1]: 2

#(Дописана строка в vim: */10 * * * * /home/ubuntu/script.sh)

# crontab: installing new crontab
ubuntu@ip-172-31-26-92:~$ sudo tail -f /var/log/syslog | grep -i cron
# Jun 10 20:26:54 ip-172-31-26-92 crontab[8646]: (root) LIST (root)
# Jun 10 20:33:56 ip-172-31-26-92 crontab[8656]: (ubuntu) BEGIN EDIT (ubuntu)
# Jun 10 20:38:01 ip-172-31-26-92 crontab[8656]: (ubuntu) REPLACE (ubuntu)
# Jun 10 20:38:01 ip-172-31-26-92 crontab[8656]: (ubuntu) END EDIT (ubuntu)
# Jun 10 20:40:01 ip-172-31-26-92 CRON[8697]: (ubuntu) CMD (/home/ubuntu/script.sh)
# Jun 10 20:40:01 ip-172-31-26-92 CRON[8696]: (CRON) info (No MTA installed, discarding output)
# Jun 10 20:50:01 ip-172-31-26-92 CRON[8718]: (ubuntu) CMD (/home/ubuntu/script.sh)
# Jun 10 21:00:01 ip-172-31-26-92 CRON[8732]: (ubuntu) CMD (/home/ubuntu/script.sh)
# ^Z
# [6]+  Stopped                 sudo tail -f /var/log/syslog | grep --color=auto -i cron
ubuntu@ip-172-31-26-92:~$ cat test.txt.bak
# print('Hello')