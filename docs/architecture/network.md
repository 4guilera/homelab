# Network architecture

## Hardware

| Device | Model | Role | VLAN |
|--------|-------|------|------|
| Router | UniFi UDR7 | Gateway, firewall, VLAN routing | All |
| Compute | Geekom A5 Pro | Proxmox hypervisor (32GB DDR4, 512GB SSD) | 20 (LAB) |
| ML | Apple Mac Mini M4 | LLM inference — Hermes | 20 (LAB) |
| Storage | UGreen NAS | Backup target, network storage | 20 (LAB) |

## VLANs

| ID | Name | Subnet | Purpose | Inter-VLAN policy |
|----|------|--------|---------|-------------------|
| 1 | DEFAULT | 192.168.1.0/24 | Untagged fallback | Isolated |
| 10 | TRUSTED | 10.0.10.0/24 | Personal devices | Internet + → LAB read |
| 20 | LAB | 10.0.20.0/24 | Homelab infrastructure | Isolated |
| 30 | IOT | 10.0.30.0/24 | IoT devices | Internet only |
| 40 | GUEST | 10.0.40.0/24 | Guest network | Internet only |
| 50 | MGMT | 10.0.50.0/24 | Network device management | Isolated |

## Known hosts (VLAN 20 — LAB)

| Hostname | IP | Service |
|----------|----|---------|
| proxmox | 10.0.20.X | Proxmox VE hypervisor |
| hermes | 10.0.20.X | Mac Mini M4 — dev workstation / LLM |
| portainer | 10.0.20.3 | Portainer + Homarr LXC |
| ugreennas | 10.0.20.X | NAS (pending config) |

## Network diagram

```
Internet
    │
  UDR7 (UniFi UDR7)
    │
    ├── VLAN 10 (TRUSTED · 10.0.10.0/24) ──── personal devices
    │
    ├── VLAN 20 (LAB · 10.0.20.0/24)
    │       ├── Proxmox (Geekom A5 Pro)
    │       │       └── Portainer LXC (10.0.20.3)
    │       ├── Hermes (Mac Mini M4)
    │       └── UGreen NAS
    │
    ├── VLAN 30 (IOT · 10.0.30.0/24) ──────── IoT devices
    ├── VLAN 40 (GUEST · 10.0.40.0/24) ─────── guest devices
    └── VLAN 50 (MGMT · 10.0.50.0/24) ─────── UniFi switch/AP mgmt
```
