#!/bin/bash
# .hack System CC - Module 05: AIDA Network Reconnaissance Simulator

TARGET_GATEWAY="172.28.20.10"
ISOLATED_SOC="172.28.10.5"

echo "=========================================================="
echo " [!] Launching AIDA Reconnaissance Scan from Rogue Node..."
echo "=========================================================="

echo -e "\n[+] Step 1: Port scanning Gateway ($TARGET_GATEWAY) on port 80..."
docker exec -it rogue_player_node nmap -Pn -p 80 $TARGET_GATEWAY

echo -e "\n[+] Step 2: Attempting unauthorized probe into isolated SOC Network ($ISOLATED_SOC)..."
echo "[*] (This boundary traversal attempt will be dropped by iptables)"
docker exec -it rogue_player_node nmap -Pn -p 22,80,443 $ISOLATED_SOC

echo -e "\n[+] Reconnaissance complete."
