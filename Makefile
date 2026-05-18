.DEFAULT_GOAL := help

.PHONY: help lint install apply-all apply-proxmox apply-nas vault-edit check

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install all required tools
	brew install ansible pre-commit
	pip3 install ansible-lint yamllint detect-secrets
	pre-commit install

lint: ## Run all pre-commit linters
	pre-commit run --all-files

apply-all: ## Apply all playbooks to all hosts
	cd ansible && ansible-playbook playbooks/site.yml --diff

apply-proxmox: ## Apply Proxmox baseline only
	cd ansible && ansible-playbook playbooks/proxmox-baseline.yml --diff

apply-nas: ## Apply NAS baseline only
	cd ansible && ansible-playbook playbooks/nas-init.yml --diff

vault-edit: ## Edit the Ansible Vault secrets file
	cd ansible && ansible-vault edit inventory/group_vars/all/vault.yml

check: ## Dry-run all playbooks
	cd ansible && ansible-playbook playbooks/site.yml --check --diff
