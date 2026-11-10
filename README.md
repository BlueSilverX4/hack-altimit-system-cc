# 🌐 ALTIMIT System CC: Enterprise Incident Response & SOC Lab

> *"An enterprise-grade, NIST CSF 2.0-aligned security laboratory and telemetry pipeline inspired by the system architecture of .hack and the concept of the unbreachable ALTIMIT OS."*

---

## 📂 Laboratory Architecture & Modules

The ALTIMIT System CC laboratory is organized into modular defensive security components, each representing a core function of an enterprise Security Operations Center (SOC).

| .hack Lore Concept | Cybersecurity Function | Lab Directory | Core Tooling |
|:---|:---|:---|:---|
| **System CC Core** | Centralized Log Aggregation & SIEM | `02-serpent-of-knowledge-siem/` | Wazuh / Loki / Zeek |
| **AIDA Anomalies** | Network Telemetry & Boundary Defense | `01-altimit-kernel-hardening/` | Docker / iptables / Suricata |
| **Data Drain** | File Integrity Monitoring & Automated Incident Response | `03-data-drain-fim-sysmon/` and `03-soar-and-response/` | SHA-256 FIM / Bash SOAR |
| **Phase Salvage** | Memory Forensics & Artifact Analysis | `04-phase-salvage-forensics/` | Python IoC Scrapers / Volatility 3 |
| **Macabre Guild / Rogue Players** | Authorized Offensive Security Simulation | `05-kali-attack-simulations/` | Nmap / Hydra / Kali Linux |

---

## ⚡ Quick Start & Laboratory Playbooks

The following commands demonstrate the primary operational workflows of the ALTIMIT System CC environment.

### 1. Deploy Network Isolation — Module 01

Initialize the isolated Docker environment and apply the laboratory firewall rules.

```bash
cd 01-altimit-kernel-hardening

docker compose up -d

sudo ./apply-firewall-rules.sh
```

### 2. Execute Attack Simulation — Module 05

Launch an authorized reconnaissance simulation against the designated laboratory environment.

```bash
cd 05-kali-attack-simulations

./01_aida_recon_scan.sh
```

### 3. Trigger Incident Response: Data Drain — Module 03

Execute the containment workflow against a designated laboratory endpoint.

```bash
cd 03-soar-and-response/containment-scripts

sudo ./data-drain.sh 172.28.30.100
```

### 4. Run Phase Salvage Artifact Forensics — Module 04

Analyze a protected configuration file using the Phase Salvage forensic utility.

```bash
cd 04-phase-salvage-forensics

python3 scripts/phase-salvage.py \
  ../03-data-drain-fim-sysmon/protected_configs/system_cc.conf
```

---

## 🛡️ NIST Cybersecurity Framework (CSF) 2.0 Mapping

The ALTIMIT System CC architecture incorporates the following NIST CSF 2.0 functions:

| NIST Function | Laboratory Implementation | Security Objective |
|:---|:---|:---|
| **Identify (ID)** | Asset identification and laboratory network mapping | Establish visibility into monitored assets and system dependencies. |
| **Protect (PR)** | Kernel hardening, Docker isolation, and firewall enforcement | Reduce attack surfaces and restrict unauthorized network access. |
| **Detect (DE)** | Zeek network telemetry, Wazuh SIEM, and SHA-256 FIM | Identify suspicious activity, anomalous network behavior, and file integrity violations. |
| **Respond (RS)** | Data Drain containment scripts and Bash SOAR workflows | Support incident containment and structured response procedures. |
| **Recover (RC)** | Phase Salvage forensic analysis and recovery workflows | Support forensic investigation, artifact preservation, and post-incident recovery. |

---

## 🔍 Core Security Capabilities

- **Centralized Security Monitoring:** Aggregation and analysis of security telemetry through Wazuh and Loki.
- **Network Detection:** Zeek and Suricata provide network visibility and detection capabilities.
- **File Integrity Monitoring:** SHA-256 hashing supports identification of unauthorized file modifications.
- **Automated Incident Response:** Bash-based SOAR workflows support repeatable containment procedures.
- **Digital Forensics:** Python-based artifact analysis and Volatility 3 support investigative workflows.
- **Attack Simulation:** Kali Linux utilities provide controlled testing of defensive monitoring and response capabilities.

---

## ⚠️ Operational Safety & Scope

This project is intended for authorized cybersecurity training, defensive security research, and isolated laboratory testing.

- Execute attack simulations only against systems you own or are explicitly authorized to test.
- Verify Docker network isolation before launching attack simulations.
- Review firewall rules before applying them to avoid disrupting host connectivity.
- Validate containment scripts before execution.
- Preserve relevant logs and forensic evidence before performing destructive remediation.
- Do not deploy laboratory containment scripts against production infrastructure without appropriate authorization and change controls.

**Important:** The term *Data Drain* is a thematic reference to .hack. Its implementation represents defensive containment and forensic workflows, not destructive data wiping.

---

## 🎯 Project Objective

ALTIMIT System CC demonstrates how modular security components can work together to form a defensive monitoring and incident response environment.

By combining network telemetry, centralized logging, file integrity monitoring, automated containment, and forensic investigation, the laboratory explores the operational lifecycle of a Security Operations Center (SOC).

**Framework Alignment:** NIST CSF 2.0 · MITRE ATT&CK  
**Environment:** Kali Linux · Docker · Python · Bash  
**Focus:** Defensive Security · SIEM · Network Monitoring · SOAR · Digital Forensics
