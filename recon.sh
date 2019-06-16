#!/bin/sh
IP="$1"
nmap -F  -sS  $IP -vv  -n  -oN fast_"$IP"  &
nmap -sS   $IP -vv -n --top-ports 1000 -oN slow-"$IP"  &
nmap -sU $IP -vv  -n --max-retries=3 -oN  udp-"$IP"  &
nmap   $IP -vv  -n -sV --version-light -oN banners-"$IP" &
nmap $IP -R -vv -sn -oN dns-"$IP" &
nmap $IP  --script smb-enum-shares -vv  -oN smb_enum-"$IP" &
nmap $IP -O -T4 -n -vv -oN OS-"$IP" &
nbtscan -vh $IP > nbt-scan-"$IP"

#example ./recon.sh 192.168.0.1-254
