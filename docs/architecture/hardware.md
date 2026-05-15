# Hardware inventory

## Geekom A5 Pro — Proxmox node

| Attribute | Value |
|-----------|-------|
| CPU | AMD Ryzen 5 5600U |
| RAM | 32GB DDR4 |
| Storage | 512GB NVMe SSD |
| OS | Proxmox VE |
| VLAN | 20 (LAB) |
| IP | 10.0.20.X |

**Running workloads:**

| Container | IP | Purpose |
|-----------|----|---------|
| Portainer + Homarr | 10.0.20.3 | Container management + dashboard |

## Apple Mac Mini M4 — Hermes

| Attribute | Value |
|-----------|-------|
| CPU | Apple M4 |
| Role | Dev workstation, LLM inference |
| VLAN | 20 (LAB) |
| IP | 10.0.20.X |

## UGreen NAS

| Attribute | Value |
|-----------|-------|
| Role | Network storage, Proxmox backup target |
| Status | Pending initial configuration |
| VLAN | 20 (LAB) |
| IP | 10.0.20.X |

## UniFi UDR7

| Attribute | Value |
|-----------|-------|
| Role | Router, firewall, VLAN management |
| Firmware | UniFi OS |
| VLANs managed | 1, 10, 20, 30, 40, 50 |
