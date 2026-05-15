# 1. Use a mono-repo for all homelab infrastructure

Date: 2025-05-17
Status: Accepted

## Context

Homelab infrastructure spans multiple concerns: network configuration,
Ansible automation, Kubernetes manifests (future), Terraform cloud resources
(future), and documentation. These could live in separate repositories.

## Decision

All infrastructure code and documentation lives in a single GitHub repository
(`homelab/`), organized by concern under top-level directories.

## Consequences

**Positive:**
- Single source of truth — one place to search, one CI pipeline
- Cross-referencing between Ansible roles and documentation is trivial
- Cleaner portfolio artifact — one URL tells the whole story

**Negative:**
- Repo grows larger over time (accepted trade-off)
- A single pipeline failure blocks all concerns (mitigated by scoped workflow jobs)

## Alternatives considered

- Per-tool repos (`homelab-ansible`, `homelab-terraform`, etc.) — rejected
  because cross-repo reference overhead outweighs isolation benefit at this scale
