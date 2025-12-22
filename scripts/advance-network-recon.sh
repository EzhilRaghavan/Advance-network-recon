#!/bin/bash

# ============================================================
# ADVANCED NMAP NETWORK RECONNAISSANCE & SERVICE ENUMERATION
# Author  : Cyber Recon Project
# Purpose : Multi-phase automated recon with logging & reports
# ============================================================

# -------------------- VALIDATION --------------------
if [ -z "$1" ]; then
    echo "Usage: $0 <TARGET_IP_OR_RANGE>"
    exit 1
fi

TARGET=$1
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BASE_DIR="scans/$TARGET-$DATE"

mkdir -p $BASE_DIR

LOGFILE="$BASE_DIR/recon.log"

echo "[+] Recon Started on $TARGET at $DATE" | tee -a $LOGFILE

# -------------------- PHASE 1 --------------------
# Host Discovery (Ping Sweep)

echo "[+] Phase 1: Host Discovery" | tee -a $LOGFILE
nmap -sn $TARGET -oN $BASE_DIR/01_host_discovery.txt

# -------------------- PHASE 2 --------------------
# Basic Port & Service Enumeration

echo "[+] Phase 2: Basic Port & Service Enumeration" | tee -a $LOGFILE
nmap -sS -sV -T4 $TARGET -oN $BASE_DIR/02_basic_enum.txt

# -------------------- PHASE 3 --------------------
# Full TCP Port Scan

echo "[+] Phase 3: Full TCP Port Scan" | tee -a $LOGFILE
nmap -p- -T4 $TARGET -oN $BASE_DIR/03_full_port_scan.txt

# -------------------- PHASE 4 --------------------
# OS Detection & Default Scripts

echo "[+] Phase 4: OS Detection & Default NSE Scripts" | tee -a $LOGFILE
nmap -O --script=default $TARGET -oN $BASE_DIR/04_os_nse.txt

# -------------------- PHASE 5 --------------------
# Vulnerability Enumeration

echo "[+] Phase 5: Vulnerability Enumeration" | tee -a $LOGFILE
nmap --script vuln $TARGET -oN $BASE_DIR/05_vulnerability_scan.txt

# -------------------- PHASE 6 --------------------
# Web Service Enumeration (If HTTP Found)

echo "[+] Phase 6: Web Enumeration" | tee -a $LOGFILE
nmap -p 80,443 --script=http-enum,http-title,http-headers $TARGET \
-oN $BASE_DIR/06_web_enum.txt

# -------------------- COMPLETION --------------------

echo "[+] Recon Completed Successfully" | tee -a $LOGFILE
echo "[+] Results stored in $BASE_DIR" | tee -a $LOGFILE

