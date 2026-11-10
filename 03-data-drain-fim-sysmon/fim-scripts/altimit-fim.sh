#!/bin/bash
# .hack System CC - Module 03: File Integrity Monitoring (FIM)
# Tracks baseline file states for unauthorized system tampering.

MONITOR_DIR="./protected_configs"
BASELINE_FILE="./fim-scripts/baseline.sha256"

mkdir -p $MONITOR_DIR

# Create a sample config if it doesn't exist
if [ ! -f "$MONITOR_DIR/system_cc.conf" ]; then
    echo "ALTIMIT_CORE_VERSION=4.0.1" > "$MONITOR_DIR/system_cc.conf"
    echo "GATEWAY_STATUS=SECURE" >> "$MONITOR_DIR/system_cc.conf"
fi

if [ "$1" == "baseline" ]; then
    echo "[+] Generating ALTIMIT System CC cryptographic baseline..."
    sha256sum $MONITOR_DIR/* > $BASELINE_FILE
    echo "[+] Baseline stored successfully at $BASELINE_FILE"

elif [ "$1" == "check" ]; then
    if [ ! -f "$BASELINE_FILE" ]; then
        echo "[-] Error: No baseline found. Run './altimit-fim.sh baseline' first."
        exit 1
    fi
    echo "[*] Verifying system integrity against baseline..."
    sha256sum -c $BASELINE_FILE --status
    if [ $? -eq 0 ]; then
        echo "[+] INTEGRITY VERIFIED: All system files are pristine."
    else
        echo "[!] DATA CORRUPTION DETECTED: Unauthorized file modification found!"
        sha256sum -c $BASELINE_FILE
    fi
else
    echo "Usage: ./altimit-fim.sh [baseline|check]"
fi
