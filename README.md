# Advanced Network Reconnaissance & Service Enumeration

## Summary
This project implements an automated *network reconnaissance and service enumeration workflow* using *Nmap*.  
It focuses on systematic host discovery, port scanning, service/version identification, and script-based enumeration within a *controlled lab environment*, following real-world security assessment practices.

---

## Capabilities
- Automated host discovery
- TCP port scanning
- Service and version enumeration
- Nmap Scripting Engine (NSE) execution
- Structured, timestamped scan outputs
- Version-controlled documentation

---

## Toolchain
Nmap · NSE · Bash · Kali Linux · Metasploitable 2 · Git · GitHub

---

## Project Structure
advance-network-Recon/
├── scripts/
│   └── advanced_nmap_recon.sh
├── scans/
│   └── advance-network-Recon/
│       ├── host_discovery.txt
│       ├── port_scan.txt
│       ├── service_enum.txt
│       └── vuln_scan.txt
├── reports/
│   └── final_report.md
└── README.md
---

## Execution
Ensure Nmap is installed and the target IP or network is configured inside the script.

```bash
bash scripts/advanced_nmap_recon.sh
