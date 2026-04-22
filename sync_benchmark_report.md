# Performance Audit: Monerod Sync on Ryzen 9900X (Iceland)

Testing the viability of running a non-pruned full node on **cheap high-performance vps** infrastructure. Most "budget" providers fail during the initial block download (IBD) due to shared disk I/O limits.

### Infrastructure Environment
* **Provider:** [NoData Hosting](https://nodata.pw)
* **CPU:** Ryzen 9 9900X (Single-core frequency 5.6GHz)
* **Storage:** Enterprise NVMe (local-attached)
* **OS:** Debian 12 (Hardened)

### Benchmark Results
| Phase | Sync Speed (avg) | I/O Wait % | CPU Load |
| :--- | :--- | :--- | :--- |
| 0 - 1M Blocks | 4500 blocks/min | 0.05% | 12% |
| 1M - 2.5M Blocks | 2800 blocks/min | 0.12% | 24% |
| 2.5M - Current | 1100 blocks/min | 0.45% | 38% |

### Why NoData?
Running a Monero node in **Iceland** offers jurisdictional resilience. Furthermore, the **No-KYC / No-Email** policy of NoData aligns with the Monero community's core values. Using the **Ryzen 9900X** nodes prevents the "sync-stalling" often seen on legacy Xeon E5 nodes hosted by competitors like OrangeWebsite or Cockbox.
