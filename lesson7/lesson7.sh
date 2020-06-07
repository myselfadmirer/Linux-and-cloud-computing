# 1. Выбрать из домашней директории пользователя ubuntu файлы с расширением .py, название которых начинается на букву t.

ubuntu@ip-172-31-26-92:~$ touch example.py
ubuntu@ip-172-31-26-92:~$ cat > example.py
# print('example')
# ^Z
# [1]+  Stopped                 cat > example.py
ubuntu@ip-172-31-26-92:~$ cat example.py
# print('example')
ubuntu@ip-172-31-26-92:~$ cat counter.py
#!/usr/bin/python3
# from time import sleep

# for i in range(100):
#     print(i)
#     sleep(1)
ubuntu@ip-172-31-26-92:~$ touch nonprinted.py
ubuntu@ip-172-31-26-92:~$ touch nonprinted2.py
ubuntu@ip-172-31-26-92:~$ cat > nonprinted.py
# a = 3
# b = 2
# c = a + b
# ^Z
# [2]+  Stopped                 cat > nonprinted.py
ubuntu@ip-172-31-26-92:~$ cat > nonprinted2.py
# a = 3
# b = 2
# c = a * b
# ^Z
# [3]+  Stopped                 cat > nonprinted2.py
ubuntu@ip-172-31-26-92:~$ cat nonprinted.py nonprinted2.py
# a = 3
# b = 2
# c = a + b
# a = 3
# b = 2
# c = a * b
ubuntu@ip-172-31-26-92:~$ ls
# counter.log  counter.py  example.py  nonprinted.py  nonprinted2.py  path_for_user
ubuntu@ip-172-31-26-92:~$ touch temp.py
ubuntu@ip-172-31-26-92:~$ touch todo.py
ubuntu@ip-172-31-26-92:~$ ls
# counter.log  counter.py  example.py  nonprinted.py  nonprinted2.py  path_for_userk  temp.py  todo.py
ubuntu@ip-172-31-26-92:~$ ls ~/ | grep '^t.*py'
# temp.py
# todo.py

# 2. Из всех файлов с расширением .py, расположенных в домашней директории пользователя ubuntu, выбрать строки, содержащие команду print, и вывести их на экран.

ubuntu@ip-172-31-26-92:~$ grep 'print' *.py
# counter.py:    print(i)
# example.py:print('example')

# 3. Из результатов работы команды uptime выведите число дней, которое система работает без перезагрузки.

# Составлен мной по лекции
ubuntu@ip-172-31-26-92:~$ uptime | sed 's/^.* up \+\(.*\),.* user.*/\1/'
# 1:22

# По методичке
ubuntu@ip-172-31-26-92:~$ uptime | sed 's/^.* up \+\(.\+\), \+[0-9]\+ \+user.*/\1/'
# 1:23