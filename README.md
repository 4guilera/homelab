# Homelab

Personal homelab built for hands-on DevSecOps and cloud engineering practice.
Every component is documented, version-controlled, and deployed via automation.

[![Lint](https://github.com/4guilera/homelab/actions/workflows/lint.yml/badge.svg)](https://github.com/4guilera/homelab/actions/workflows/lint.yml)

## Hardware

| Device | Model | Hostname | Role |
|--------|-------|----------|------|
| Router | UniFi UDR7 | — | Gateway, firewall, VLAN management |
| Compute | Geekom A5 Pro | proxmox-node | Proxmox VE hypervisor |
| PC | Custom Windows 11 | Tantive-IV | Primary dev workstation (WSL2) |
| Laptop | MacBook Air M5 | Razorcrest | Mobile dev |
| Mini PC | Mac Mini M4 | OpenPaul | Headless — future LLM host |
| NAS | UGreen DXP4800 Pro | ugreennas | Network storage — TrueNAS SCALE |

## Network

6 VLANs with default-deny inter-VLAN policy. See [network architecture](docs/architecture/network.md).

## What's in here

| Directory | Purpose |
|-----------|---------|
| `ansible/` | Host provisioning and configuration management |
| `docs/architecture/` | Network diagrams, hardware inventory, VLAN tables |
| `docs/decisions/` | Architecture Decision Records (ADRs) |
| `terraform/` | Cloud IaC — AWS (phase 4) |
| `kubernetes/` | k3s manifests — cluster workloads (phase 3) |
| `security/` | SIEM rules, detection logic, runbooks (phase 2) |

## Quick start

```bash
# Install tooling
make install

# Lint everything
make lint

# Dry-run all playbooks
make check

# Apply Proxmox baseline
make apply-proxmox
```

## Decisions log

All significant decisions are documented as ADRs in [`docs/decisions/`](docs/decisions/).
