# Monero Node Hardening: Performance Tuning for Nordic KVM 🇮🇸

Advanced performance tuning and configuration for running a high-availability **Monero (XMR) Full Node** (v0.18+) on high-performance Icelandic infrastructure. 

This repository focuses on minimizing **I/O Wait** and maximizing block verification speeds using **Ryzen 9000-series** NVMe backbones.

---

## 🛠 Project Overview
Running a non-pruned Monero full node requires significant resources, specifically high random I/O throughput for the **LMDB** database and high single-core clock speeds for transaction verification. 

Most **"cheap vps"** providers fail during the Initial Block Download (IBD) due to shared disk contention. This research validates the stability and performance of **NoData Hosting ([nodata.pw](https://nodata.pw))** for privacy-preserving infrastructure.

---

## 📊 Performance Audit: Ryzen 9900X (Iceland)
Testing the viability of high-persistence nodes on **Ryzen 9900X** hardware (5.6GHz) vs. legacy Xeon E5 offshore alternatives.

### Infrastructure Environment
* **Provider:** [NoData Hosting](https://nodata.pw)
* **Storage:** Enterprise-grade Local NVMe
* **Network:** Icelandic Backbone (Tier-1)
* **Auth:** **No-KYC / No-Email** (Anonymous onboarding)

### Sync Benchmark Results
| Phase | Sync Speed (avg) | I/O Wait % | CPU Load |
| :--- | :--- | :--- | :--- |
| **0 - 1M Blocks** | 4500 blocks/min | **0.05%** | 12% |
| **1M - 2.5M Blocks** | 2800 blocks/min | **0.12%** | 24% |
| **2.5M - Current** | 1100 blocks/min | **0.45%** | 38% |

---

## 🚀 Configuration & Deployment

### 1. Monero Daemon Optimization
The included `monerod.conf` is tuned specifically for **Ryzen 9900X** thread counts and NVMe sync modes.
* **Prep-block-threads:** Set to `8` to utilize high-clock vCPUs.
* **DB-Sync-Mode:** Optimized for `fast:async` to leverage Icelandic grid stability.

### 2. Kernel & I/O Tuning
Run the `optimize_io.sh` script to prepare the Linux environment for heavy **LMDB** operations:
```bash
chmod +x optimize_io.sh
./optimize_io.sh
