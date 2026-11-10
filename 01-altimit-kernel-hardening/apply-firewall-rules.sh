#!/bin/bash
# ALTIMIT OS Kernel Hardening - Subnet Microsegmentation Rules

echo "[+] Applying iptables rule isolation for ALTIMIT System CC..."

# Flush previous rule instances
sudo iptables -D FORWARD -s 172.28.30.0/24 -d 172.28.10.0/24 -j DROP 2>/dev/null
sudo iptables -D FORWARD -s 172.28.30.0/24 -d 172.28.10.0/24 -j LOG --log-prefix "ALTIMIT_AIDA_ALERT: " 2>/dev/null

# Insert LOG rule first so packets hit it before being dropped
sudo iptables -I FORWARD 1 -s 172.28.30.0/24 -d 172.28.10.0/24 -j LOG --log-prefix "ALTIMIT_AIDA_ALERT: " --log-level 4
sudo iptables -I FORWARD 2 -s 172.28.30.0/24 -d 172.28.10.0/24 -j DROP

echo "[+] Microsegmentation rules successfully applied."
