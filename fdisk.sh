#!/bin/bash
device=$1
echo "u
p
n
p
1
32768

w
q" | fdisk $device
