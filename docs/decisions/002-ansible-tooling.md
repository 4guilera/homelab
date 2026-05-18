# 2. Use Ansible for configuration management with pre-commit enforcement

Date: 2025-05-17
Status: Accepted

## Context

Homelab infrastructure needs to be provisioned and configured in a repeatable,
auditable way. Manual configuration via SSH is error-prone and leaves no record
of what changed, when, and why. A configuration management tool is needed.

## Decision

Ansible is used for all host configuration management, with the following
supporting toolchain:

- `ansible-lint` — enforces Ansible best practices and catches common mistakes
- `yamllint` — enforces consistent YAML formatting across all files
- `detect-secrets` — prevents accidental commit of credentials or tokens
- `pre-commit` — runs all linters automatically on every git commit
- Ansible Vault — encrypts sensitive variables at rest in the repository

## Consequences

**Positive:**
- Every host configuration is codified, version-controlled, and repeatable
- Pre-commit hooks catch issues before they reach GitHub
- Ansible's agentless architecture means no additional software needed on
  managed hosts — only SSH access is required
- Playbooks double as documentation of the intended system state

**Negative:**
- Ansible is not ideal for stateful orchestration (accepted — not needed here)
- Pre-commit adds friction to commits (accepted — the safety is worth it)

## Alternatives considered

- Chef / Puppet — rejected due to agent requirement and higher operational
  overhead at homelab scale
- Shell scripts — rejected because they are not idempotent and produce no
  structured audit trail
- Manual SSH configuration — rejected entirely; no repeatability or documentation
