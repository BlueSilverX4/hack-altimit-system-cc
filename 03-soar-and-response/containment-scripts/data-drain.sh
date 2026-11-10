#!/bin/bash
# ==========================================================
# .hack System CC - Incident Response Playbook: DATA_DRAIN
# ==========================================================

ATTACKER_IP=$1

if [ -z "$ATTACKER_IP" ]; then
    echo "[-] Error: No target IP provided for Data Drain execution."
    echo "    Usage: ./data-drain.sh <IP_ADDRESS>"
    exit 1
fi

echo "=========================================================="
echo " [!] INITIATING DATA DRAIN PROTOCOL ON: $ATTACKER_IP"
echo "=========================================================="

# Step 1: Apply immediate network quarantine (Isolate Rogue Node)
echo "[+] [Phase 1] Purging malicious network state via iptables..."
sudo iptables -A INPUT -s $ATTACKER_IP -j DROP
sudo iptables -A FORWARD -s $ATTACKER_IP -j DROP

# Step 2: Terminate active container sessions if running locally
echo "[+] [Phase 2] Compressing anomalous endpoint logs..."
mkdir -p ./quarantine_artifacts
date >> ./quarantine_artifacts/drain_event_log.txt
echo "Target IP $ATTACKER_IP neutralized and isolated." >> ./quarantine_artifacts/drain_event_log.txt

# Step 3: Verification signal
echo "[+] [Phase 3] Data Drain execution complete. Node purged from active matrix."
echo "=========================================================="
