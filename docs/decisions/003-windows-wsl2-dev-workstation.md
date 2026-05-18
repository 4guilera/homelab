# 3. Use Windows 11 with WSL2 as primary homelab dev workstation

Date: 2025-05-18
Status: Accepted

## Context

Homelab automation tooling (Ansible, pre-commit, yamllint, ansible-lint) runs
natively on Linux and macOS but not on Windows. A decision was needed on how
to run these tools from the primary Windows 11 desktop (Tantive-IV).

## Decision

Windows Subsystem for Linux 2 (WSL2) with Ubuntu is used as the primary
development environment on Tantive-IV. All homelab tooling is installed and
run inside the WSL2 Ubuntu environment. The repository lives in the WSL2
Linux filesystem at ~/homelab to avoid Windows filesystem permission issues.

## Consequences

**Positive:**
- Full Linux toolchain available on a Windows machine with no dual-boot
- WSL2 filesystem avoids the permission and performance issues of /mnt/c
- Mirrors the Linux environments used in most DevSecOps roles
- macOS (Razorcrest) can be used as a secondary workstation with the same
  toolchain via Homebrew

**Negative:**
- Two separate SSH keys needed — one per machine (Tantive-IV WSL2, Razorcrest)
- Razorcrest cannot reach homelab infrastructure when off the home network
  without a VPN solution

## Alternatives considered

- Native Windows tooling — rejected due to lack of Ansible support on Windows
- Dual-boot Linux — rejected due to unnecessary complexity
- Dedicated Linux VM on Tantive-IV — rejected in favour of WSL2 which is
  lower overhead and better integrated with the Windows desktop
- Tailscale VPN — considered for remote access, deferred to a future decision
