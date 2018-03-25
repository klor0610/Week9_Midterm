#!/bin/bash

#change to current directory
cd
pwd
echo "let's create two files using echo and touch"
#create and add a list to 2 different files
echo "MN">week_002.txt
echo "NM">>week_002.txt
echo "IL">>week_002.txt
touch week_022.txt
echo "MN">>week_022.txt
echo "NM">>week_022.txt
echo "AL">>week_022.txt
sleep 5s
cat week_022.txt
#show difference between the two files
echo ""
sleep 3s
echo "Here are the differences of two files, week_002.txt and week_022.txt"
diff week_002.txt week_022.txt
#search for similarities in the two files, option i allows upper and
#lower case search
sleep 2s
echo "let's try searching for m in week_002.txt"
sleep 2s
grep -i m  week_002.txt
echo "hit enter to sort file week_002.txt in alphabetical order"
read enter
#sort both files
sort -d week_002.txt
echo "press enter to see the 2nd file sorted"
read enter
sort -d week_022.txt
#remove files
rm week_022.txt
#use tail to see last 10 lines (granted there are only 3)
info tail | less
sleep 3s
tail /home/kasia/week_002.txt
#create a new directory
man mkdir | less
mkdir Midterm
cd Midterm
echo ""
sleep 3s
pwd
#create a new file in the new directory Mideterm
echo "Linux Midterm" > newfile1
cat newfile1
sleep 3s
#move file from Midterm to cd
mv -v ~/Midterm/* ~
cd ~
ls
#give only user read/wrtie and group/other only read permission
chmod 644 newfile1
#give only user RWX permissions
chmod 700 ~/Midterm
#send blah blah into null to be discarded
echo blah blah > /dev/null
sleep 3s
echo "now that we have played with files and directories, lets take a look at the partition table"
#show patition table
sudo fdisk -l /dev/sda
sleep 3s
#create a partition & filesystem
dd if=/dev/zero of=./12MB.img bs=1M count=12
hexdump ./12MB.img | less
sleep 3s
#make the filesystem ext4
mkfs -t ext4 ./12MB.img
#create mount point
sudo mkdir /media/tmp2
sudo mount ./12MB.img /media/tmp2
mount; df -h
sleep 2s
lsblk
#input content into file
cd /media/tmp2
echo "Hello World" > ~/hello12.txt
cd ~
sudo umount /media/tmp2
#look through file with output set to hex and ASCII
hexdump -C ./12MB.img | less
sleep 3s
echo "hit enter to see kernel log and boot parameters"
read
#shows kernel log
cat /var/log/kern.log | less
#kernel boot parameters
cat /proc/cmdline
echo "lastly, lets check out all kernel messages with sd(a)"
dmesg | grep sd
echo "press enter to update and install systemd and to show all active and non active units"
read
sudo apt-get update
sudo apt-get install systemd
sleep 3s
systemctl --all
