#!/bin/bash

# Advanced Nmap network reconnaissance and service enumeration
# Performs multi-phase scanning with organized output and logging

# Validate input
if [ -z "$1" ]; then
    echo "Usage: $0 <TARGET_IP_OR_RANGE>"
    exit 1
fi

TARGET=$1
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BASE_DIR="scans/${TARGET}-${DATE}"
LOGFILE="$BASE_DIR/recon.log"

mkdir -p "$BASE_DIR"

echo "[+] Recon started on $TARGET at $DATE" | tee -a "$LOGFILE"

# Phase 1: Host discovery (ping sweep)
echo "[+] Phase 1: Host discovery" | tee -a "$LOGFILE"
nmap -sn "$TARGET" -oN "$BASE_DIR/01_host_discovery.txt"

# Phase 2: Basic port and service enumeration
echo "[+] Phase 2: Basic port and service enumeration" | tee -a "$LOGFILE"
nmap -sS -sV -T4 "$TARGET" -oN "$BASE_DIR/02_basic_enum.txt"

# Phase 3: Full TCP port scan
echo "[+] Phase 3: Full TCP port scan" | tee -a "$LOGFILE"
nmap -p- -T4 "$TARGET" -oN "$BASE_DIR/03_full_port_scan.txt"

# Phase 4: OS detection and default NSE scripts
echo "[+] Phase 4: OS detection and default scripts" | tee -a "$LOGFILE"
nmap -O --script=default "$TARGET" -oN "$BASE_DIR/04_os_nse.txt"

# Phase 5: Vulnerability enumeration using NSE
echo "[+] Phase 5: Vulnerability enumeration" | tee -a "$LOGFILE"
nmap --script vuln "$TARGET" -oN "$BASE_DIR/05_vulnerability_scan.txt"

# Phase 6: Web service enumeration (common HTTP/HTTPS ports)
echo "[+] Phase 6: Web service enumeration" | tee -a "$LOGFILE"
nmap -p 80,443 --script=http-enum,http-title,http-headers "$TARGET" \
-oN "$BASE_DIR/06_web_enum.txt"

# Completion
echo "[+] Recon completed successfully" | tee -a "$LOGFILE"
echo "[+] Results stored in $BASE_DIR" | tee -a "$LOGFILE"
