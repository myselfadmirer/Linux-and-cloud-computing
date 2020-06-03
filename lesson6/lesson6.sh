# 1. Создать AMI на основе имеющегося у вас инстанса.

C:\Users\NELYUBINA>ssh -i key.pem ubuntu@34.219.160.1
# Для провеки был установлен zip
ubuntu@ip-172-31-26-92:~$ sudo apt install zip
ubuntu@ip-172-31-26-92:~$ dpkg -l
# При вызове списка программ отображается zip (Установленные программы.JPG в приложении)
# Созданный AMI в приложении AMI.JPG

# 2. Создать новый инстанс на основе AMI, сделанного в предыдущем задании. 
# Проверить, присутствуют ли на новом инстансе программы, установленные на исходном инстансе.

C:\Users\NELYUBINA>ssh -i key.pem ubuntu@54.245.47.45
# Новый инстанс, созданный с помощью AMI - приложение New instance.JPG
ubuntu@ip-172-31-22-168:~$ dpkg -l
# При вызове списка программ также отображается zip (Установленные программы 2instance.JPG в приложении)

# 3. Добавить новый диск к используемому инстансу. Проверить доступ к этому диску и создать на нем текстовый файл test.txt, 
# содержащий слово test. Затем создать новый инстанс, отсоединить диск от старого и подсоединить к новому. 
# Проверить наличие на диске файла test.txt и просмотреть его в текстовом редакторе nano.

# Новый диск подключен к вновь созданному инстансу на основе AMI - приложение - Новый диск.JPG и Подключение.JPG
ubuntu@ip-172-31-22-168:~$ lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# loop0     7:0    0   18M  1 loop /snap/amazon-ssm-agent/1566
# loop1     7:1    0 93.8M  1 loop /snap/core/8935
# loop2     7:2    0 93.9M  1 loop /snap/core/9066
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk
ubuntu@ip-172-31-22-168:~$ sudo file -s /dev/xvdf
# /dev/xvdf: data
ubuntu@ip-172-31-22-168:~$ sudo mkfs -t xfs /dev/xvdf
# meta-data=/dev/xvdf              isize=512    agcount=4, agsize=131072 blks
#          =                       sectsz=512   attr=2, projid32bit=1
#          =                       crc=1        finobt=1, sparse=0, rmapbt=0, reflink=0
# data     =                       bsize=4096   blocks=524288, imaxpct=25
#          =                       sunit=0      swidth=0 blks
# naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
# log      =internal log           bsize=4096   blocks=2560, version=2
#          =                       sectsz=512   sunit=0 blks, lazy-count=1
# realtime =none                   extsz=4096   blocks=0, rtextents=0
ubuntu@ip-172-31-22-168:~$ sudo file -s /dev/xvdf
# /dev/xvdf: SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)
ubuntu@ip-172-31-22-168:~$ sudo mkdir /data
ubuntu@ip-172-31-22-168:~$ ls / | grep data
data
ubuntu@ip-172-31-22-168:~$ sudo mount /dev/xvdf /data
ubuntu@ip-172-31-22-168:~$ df
# Filesystem     1K-blocks    Used Available Use% Mounted on
# udev              478592       0    478592   0% /dev
# tmpfs             100232     748     99484   1% /run
# /dev/xvda1       8065444 1831808   6217252  23% /
# tmpfs             501152       0    501152   0% /dev/shm
# tmpfs               5120       0      5120   0% /run/lock
# tmpfs             501152       0    501152   0% /sys/fs/cgroup
# /dev/loop0         18432   18432         0 100% /snap/amazon-ssm-agent/1566
# /dev/loop2         96256   96256         0 100% /snap/core/9066
# /dev/loop1         96128   96128         0 100% /snap/core/8935
# tmpfs             100228       0    100228   0% /run/user/1000
# /dev/xvdf        2086912   35092   2051820   2% /data
ubuntu@ip-172-31-22-168:~$ cd /data/
ubuntu@ip-172-31-22-168:/data$ pwd
# /data
ubuntu@ip-172-31-22-168:/data$ ls -la
# total 4
# drwxr-xr-x  2 root root    6 Jun  3 19:43 .
# drwxr-xr-x 24 root root 4096 Jun  3 19:45 ..
ubuntu@ip-172-31-22-168:/data$ sudo chmod o+w /data/
ubuntu@ip-172-31-22-168:/data$ ls -la
# total 4
# drwxr-xrwx  2 root root    6 Jun  3 19:43 .
# drwxr-xr-x 24 root root 4096 Jun  3 19:45 ..
ubuntu@ip-172-31-22-168:/data$ touch test.txt
ubuntu@ip-172-31-22-168:/data$ cat > test.txt
# Hello, world!
# NEW DATA
# ^Z
# [1]+  Stopped                 cat > test.txt
ubuntu@ip-172-31-22-168:/data$ cat test.txt
# Hello, world!
# NEW DATA
ubuntu@ip-172-31-22-168:/data$ exit
# logout
# There are stopped jobs.
ubuntu@ip-172-31-22-168:/data$ exit
# logout
# Connection to 54.245.47.45 closed.

# Диск подключен к другому инстансу - приложение - Переключение.JPG и Новое подключение.JPG
# Подключение в командной строке к другому инстансу.
C:\Users\NELYUBINA>ssh -i key.pem ubuntu@18.236.171.202
# Повторяем операции с монтированием диска
ubuntu@ip-172-31-26-92:~$ lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# loop0     7:0    0   18M  1 loop /snap/amazon-ssm-agent/1566
# loop1     7:1    0 93.8M  1 loop /snap/core/8935
# loop2     7:2    0 93.9M  1 loop /snap/core/9066
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk
ubuntu@ip-172-31-26-92:~$ sudo mkdir /data
ubuntu@ip-172-31-26-92:~$ ls / | grep data
# data
ubuntu@ip-172-31-26-92:~$ sudo mount /dev/xvdf /data
ubuntu@ip-172-31-26-92:~$ df
# Filesystem     1K-blocks    Used Available Use% Mounted on
# udev              478592       0    478592   0% /dev
# tmpfs             100232     748     99484   1% /run
# /dev/xvda1       8065444 1860636   6188424  24% /
# tmpfs             501152       0    501152   0% /dev/shm
# tmpfs               5120       0      5120   0% /run/lock
# tmpfs             501152       0    501152   0% /sys/fs/cgroup
# /dev/loop0         18432   18432         0 100% /snap/amazon-ssm-agent/1566
# /dev/loop1         96128   96128         0 100% /snap/core/8935
# /dev/loop2         96256   96256         0 100% /snap/core/9066
# tmpfs             100228       0    100228   0% /run/user/1000
# /dev/xvdf        2086912   35096   2051816   2% /data
ubuntu@ip-172-31-26-92:~$ cd /data/
ubuntu@ip-172-31-26-92:/data$ ls -la
# total 8
# drwxr-xrwx  2 root   root     22 Jun  3 19:55 .
# drwxr-xr-x 24 root   root   4096 Jun  3 20:13 ..
# -rw-rw-r--  1 ubuntu ubuntu   23 Jun  3 19:56 test.txt
ubuntu@ip-172-31-26-92:/data$ nano test.txt
# Приложение - nano.JPG

# Автоматическое подключение
ubuntu@ip-172-31-26-92:/data$ cat /etc/fstab
# LABEL=cloudimg-rootfs   /        ext4   defaults,discard        0 0
ubuntu@ip-172-31-26-92:/data$ sudo cp /etc/fstab /etc/fstab.orig
ubuntu@ip-172-31-26-92:/data$ blkid
# /dev/xvda1: LABEL="cloudimg-rootfs" UUID="6156ec80-9446-4eb1-95e0-9ae6b7a46187" TYPE="ext4" PARTUUID="fe3a9f65-01"
ubuntu@ip-172-31-26-92:/data$ exit
# logout
# Connection to 18.236.171.202 closed.

# Перезагрузка
C:\Users\NELYUBINA>ssh -i key.pem ubuntu@18.236.171.202
# Монтируем диск
ubuntu@ip-172-31-26-92:~$ sudo mount /dev/xvdf /data
ubuntu@ip-172-31-26-92:~$ cd /data/
ubuntu@ip-172-31-26-92:/data$ ls -la
# total 8
# drwxr-xrwx  2 root   root     22 Jun  3 20:15 .
# drwxr-xr-x 24 root   root   4096 Jun  3 20:47 ..
# -rw-rw-r--  1 ubuntu ubuntu   23 Jun  3 19:56 test.txt
ubuntu@ip-172-31-26-92:/data$ blkid
# /dev/xvda1: LABEL="cloudimg-rootfs" UUID="6156ec80-9446-4eb1-95e0-9ae6b7a46187" TYPE="ext4" PARTUUID="fe3a9f65-01"
# /dev/xvdf: UUID="9bd38019-46c3-4198-8b68-b14be3aae214" TYPE="xfs"
ubuntu@ip-172-31-26-92:/data$ sudo nano /etc/fstab
ubuntu@ip-172-31-26-92:/data$ sudo cat /etc/fstab
# LABEL=cloudimg-rootfs   /        ext4   defaults,discard        0 0
# UUID=9bd38019-46c3-4198-8b68-b14be3aae214 /data  xfs  defaults,nofail  0  2
