# 1. Создать пользователя user_new и предоставить ему права 
# на редактирование файла с программой, выводящей на экран Hello, world!

# Создаем нового пользователя
ubuntu@ip-172-31-26-92:~$ sudo useradd -m -s /bin/bash user_new

# Создаем пароль для нового пользователя
ubuntu@ip-172-31-26-92:~$ sudo passwd user_new
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully

# Сощдаем директорию
ubuntu@ip-172-31-26-92:~$ mkdir user_new
ubuntu@ip-172-31-26-92:~$ cd user_new

# Проверяем, что пользователь создан
ubuntu@ip-172-31-26-92:~/user_new$ su user_new
Password:
user_new@ip-172-31-26-92:/home/ubuntu/user_new$ su ubuntu
Password:

# Создаем файл, который выводит 'Hello, world!'
ubuntu@ip-172-31-26-92:~/user_new$ vim user_new.py
ubuntu@ip-172-31-26-92:~/user_new$ python3 user_new.py
Hello, world!

# 2. Зайти под юзером user_new и с помощью редактора Vim 
# поменять фразу в скрипте из пункта 1 на любую другую.

# Добавляем права нав редактирование файла для других пользователей
ubuntu@ip-172-31-26-92:~/user_new$ chmod o+w user_new.py
ubuntu@ip-172-31-26-92:~/user_new$ ls -la
total 16
drwxrwxr-x 2 ubuntu ubuntu 4096 May 27 17:55 .
drwxr-xr-x 7 ubuntu ubuntu 4096 May 27 17:55 ..
-rw-rw-r-- 1 ubuntu ubuntu   13 May 27 15:48 user_file.txt
-rw-rw-rw- 1 ubuntu ubuntu   23 May 27 17:55 user_new.py

# Переключаемся на нового пользователя
ubuntu@ip-172-31-26-92:~/user_new$ su user_new
Password:

# Меняем фразу вывода в файле
user_new@ip-172-31-26-92:/home/ubuntu/user_new$ vim user_new.py
user_new@ip-172-31-26-92:/home/ubuntu/user_new$ python3 user_new.py
Hello, user!

# 3.* Под юзером user_new зайти в его домашнюю директорию и создать 
# программу на Python, выводящую в консоль цифры от 1 до 10 включительно 
# с интервалом в 1 секунду.

# Переходим в домашнюю директорию нового потльзователя
user_new@ip-172-31-26-92:/home/ubuntu/user_new$ cd ~
user_new@ip-172-31-26-92:~$ pwd
/home/user_new
user_new@ip-172-31-26-92:~$ ls -la
total 24
drwxr-xr-x 2 user_new user_new 4096 May 27 18:05 .
drwxr-xr-x 4 root     root     4096 May 27 16:24 ..
-rw-r--r-- 1 user_new user_new  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 user_new user_new 3771 Apr  4  2018 .bashrc
-rw-r--r-- 1 user_new user_new  807 Apr  4  2018 .profile
-rw------- 1 user_new user_new  875 May 27 18:05 .viminfo

# Создаем файл со скриптом и проверяем
user_new@ip-172-31-26-92:~$ vim count.py
user_new@ip-172-31-26-92:~$ cat count.py
from time import sleep

for i in range(1, 11):
    print(i)
    sleep(1)
user_new@ip-172-31-26-92:~$ python3 count.py
1
2
3
4
5
6
7
8
9
10
user_new@ip-172-31-26-92:~$