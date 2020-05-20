Microsoft Windows [Version 10.0.18363.836]
(c) Корпорация Майкрософт (Microsoft Corporation), 2019. Все права защищены.

ubuntu@ip-172-31-26-92:~$ mkdir lesson3
ubuntu@ip-172-31-26-92:~$ cd lesson3

#1. С помощью текстового редактора Vim создать файл 
#с программой на Python, выводящей текст Hello, world!
ubuntu@ip-172-31-26-92:~/lesson3$ vim hello.py
ubuntu@ip-172-31-26-92:~/lesson3$ python3 hello.py
Hello, World!

#2. Запустить команду, определяющую число строк в файле.
ubuntu@ip-172-31-26-92:~/lesson3$ wc -l hello.py
1 hello.py

#3. Создать еще один файл с командой на Python, 
#выводящей текст Linear regression.
ubuntu@ip-172-31-26-92:~/lesson3$ nano linear.py
ubuntu@ip-172-31-26-92:~/lesson3$ python3 linear.py
Linear regression

#4. Объединить эти два файла с помощью команды cat.
ubuntu@ip-172-31-26-92:~/lesson3$ cat hello.py linear.py > lesson3.py
ubuntu@ip-172-31-26-92:~/lesson3$ python3 lesson3.py
Hello, World!
Linear regression
ubuntu@ip-172-31-26-92:~/lesson3$ cat hello.py linear.py
print('Hello, World!')
print('Linear regression')

#5. Придумать три случая применения команды cat для работы 
#с текстовыми файлами.

#Подсчет строк во всех файлах .py в директории
ubuntu@ip-172-31-26-92:~/lesson3$ cat *.py | wc -l
4

#Запись данных
ubuntu@ip-172-31-26-92:~/lesson3$ cat > lesson3.py
a = 2
b = 3
print(a ** b)

#Вывод данных
ubuntu@ip-172-31-26-92:~/lesson3$ cat lesson3.py
a = 2
b = 3
print(a ** b)
ubuntu@ip-172-31-26-92:~/lesson3$ python3 lesson3.py
8

#Чтение файлов с помощью less
ubuntu@ip-172-31-26-92:~/lesson3$ cat lesson3.py | less

#Чтение файлов с помощью more
ubuntu@ip-172-31-26-92:~/lesson3$ ubuntu@ip-172-31-26-92:~/lesson3$ cat lesson3.py | more
a = 2
b = 3
print(a ** b)

#Построчный вывод с нумерацией строк
ubuntu@ip-172-31-26-92:~/lesson3$ cat -n lesson3.py
     1  a = 2
     2  b = 3
     3  print(a ** b)

#Копирование файла
ubuntu@ip-172-31-26-92:~/lesson3$ cat lesson3.py > example.py
ubuntu@ip-172-31-26-92:~/lesson3$ cat example.py
a = 2
b = 3
print(a ** b)

#Объединение данных из существующих файлов в новом
ubuntu@ip-172-31-26-92:~/lesson3$ cat hello.py linear.py > lesson3.py
ubuntu@ip-172-31-26-92:~/lesson3$ cat lesson3.py
print('Hello, World!')
print('Linear regression')
