# 1. Запустить htop и посмотреть, сколько процессоров и оперативной памяти есть на сервере.
# Приложение - скриншот '#1.jpg'
ubuntu@ip-172-31-26-92:~$ htop

# 2. Найти все программы с расширением .py.
ubuntu@ip-172-31-26-92:~$ vim counter.py
ubuntu@ip-172-31-26-92:~$ cat counter.py
from time import sleep

for i in range(100):
    print(i)
    sleep(1)
ubuntu@ip-172-31-26-92:~$ find ./ -type f -name "*.py"
./counter.py
./path_for_user/user_new.py

# 3. * Создать и запустить программу на Python, выводящую числа от 0 до 100 включительно.
# Запустить htop во время выполнения программы и найти выполняемую программу в списке процессов, 
# используя поиск по ключевому слову python (использовать средства поиска htop).
# Приложение - скриншот '#3.jpg'
ubuntu@ip-172-31-26-92:~$ chmod u+x counter.py
ubuntu@ip-172-31-26-92:~$ which python3
/usr/bin/python3
ubuntu@ip-172-31-26-92:~$ vim counter.py
ubuntu@ip-172-31-26-92:~$ cat counter.py
# Точка нужна для того, чтобы строка не определялась, как комментарий
.#!/usr/bin/python3
from time import sleep

for i in range(100):
    print(i)
    sleep(1)
ubuntu@ip-172-31-26-92:~$ echo > counter.log
ubuntu@ip-172-31-26-92:~$ ./counter.py > counter.log &
[1] 10393
ubuntu@ip-172-31-26-92:~$ htop
[1]+  Done                    ./counter.py > counter.log
# Остановка процесса (просто ради интереса)
ubuntu@ip-172-31-26-92:~$ ./counter.py > counter.log &
[1] 2550
ubuntu@ip-172-31-26-92:~$ htop
[1]+  Terminated              ./counter.py > counter.log
ubuntu@ip-172-31-26-92:~$ ./counter.py > counter.log &
[1] 2553
ubuntu@ip-172-31-26-92:~$ htop
[1]+  Killed                  ./counter.py > counter.log

# 4 **Вывести идентификаторы трёх процессов которые принадлежат пользователю root и потребляют наибольший объём памяти. 
# Задание нужно выполнить одной командой.
ubuntu@ip-172-31-26-92:~$ ps -U "root" --format="%mem uname pid cmd" --sort=-%mem|head -n 4
%MEM USER       PID CMD
 2.5 root       892 /usr/lib/snapd/snapd
 2.0 root       937 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
 1.7 root       846 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers