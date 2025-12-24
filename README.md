Advanced Nmap Network Reconnaissance & Service Enumeration

Overview
---------
This project is a Bash-based automation script designed to perform structured network reconnaissance using Nmap.
It executes a sequence of scans that move from basic host discovery to deeper service, OS, vulnerability, and web enumeration.

The goal of the project is to reduce manual effort during reconnaissance while keeping scan results organized, timestamped, and easy to review later.

This script is intended for learning, lab environments, and authorized security assessments only.

Scope of the Project
---------------------
This project focuses on the reconnaissance and enumeration phase of network security testing.

->In Scope

Host discovery and live host identification

TCP port scanning

Service and version detection

Operating system fingerprinting

Basic vulnerability enumeration using NSE

Web service enumeration on common HTTP/HTTPS ports

Logging and structured output storage

Objectives
-----------
The main objectives of this project are:

Automate repetitive Nmap reconnaissance tasks

Maintain a clear and repeatable scanning workflow

Store scan results in a structured and timestamped format

Improve visibility into network exposure

Practice real-world reconnaissance techniques used in SOC and penetration testing

Process Flow
-------------
The script accepts a target IP address or network range as input and performs the following phases sequentially:

Phase 1: Host Discovery

Identifies live hosts using ICMP and ARP-based ping scanning.
This helps avoid unnecessary scanning of inactive systems.

Phase 2: Basic Port and Service Enumeration

Performs a TCP SYN scan with service and version detection on common ports.
This phase provides an initial understanding of exposed services.

Phase 3: Full TCP Port Scan

Scans all 65,535 TCP ports to identify services running on non-standard ports.

Phase 4: OS Detection and Default Scripts

Uses OS fingerprinting and default NSE scripts to gather system-level information and common misconfigurations.

Phase 5: Vulnerability Enumeration

Runs Nmap vulnerability scripts to identify known weaknesses and insecure configurations.

Phase 6: Web Service Enumeration

Targets common web ports (80 and 443) and enumerates HTTP headers, titles, and exposed directories.

Each phase saves its results to a separate output file for easy analysis.

Output file Structure 
----------------------
recon.log
Records the execution flow and scan progress.

01_host_discovery.txt
Lists live hosts discovered during the ping sweep.

02_basic_enum.txt
Shows open ports and detected services.

03_full_port_scan.txt
Contains results of the full TCP port scan.

04_os_nse.txt
Displays OS detection and default script output.

05_vulnerability_scan.txt
Highlights potential vulnerabilities identified by NSE.

06_web_enum.txt
Provides information about web services and HTTP metadata.

Requirements
------------
Linux-based operating system

Bash shell

Nmap installed

Root or sudo privileges (required for SYN scanning and OS detection)

Usage
------
chmod +x recon.sh
./recon.sh <TARGET_IP_OR_RANGE>

Example:

./recon.sh 192.168.1.0/24

Intended Use
-------------
This project is intended for:

Learning network reconnaissance

Practicing penetration testing workflows

SOC and blue-team visibility exercises

Authorized lab environments (TryHackMe, Hack The Box, internal labs)

Legal Disclaimer
----------------
This tool must only be used on systems you own or have explicit permission to test.
Unauthorized scanning of networks may be illegal and unethical.

Final Note
-----------
This script is intentionally kept readable and modular so it can be extended later with:

UDP scanning

Conditional scanning logic

Target-specific profiles

Report generation
