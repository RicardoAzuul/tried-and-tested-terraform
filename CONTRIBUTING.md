# Contributing

Thanks for contributing to this Terraform repo.

## What You Need

Install these tools before you start:

1. Git
2. Terraform (version `>= 1.0`, this repo uses AzureRM `~> 4.0`)
3. Python 3 + `pipx` (recommended) or `pip`
4. pre-commit
5. Azure CLI (`az`) for authentication to Azure
6. SSH key pair (public key value is required by this project)

## Install Prerequisites

### Windows (PowerShell)

```powershell
winget install --id Git.Git -e
winget install --id Hashicorp.Terraform -e
winget install --id Python.Python.3.12 -e
winget install --id Microsoft.AzureCLI -e
python -m pip install --user pipx
python -m pipx ensurepath
pipx install pre-commit
```

### macOS (Homebrew)

```bash
brew install git terraform python azure-cli pipx
pipx ensurepath
pipx install pre-commit
```

### Linux (example with apt)

```bash
sudo apt-get update
sudo apt-get install -y git python3 python3-pip azure-cli
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install pre-commit
```

Install Terraform on Linux from HashiCorp's official repository if it is not available in your distro packages.

## One-Time Repo Setup

From the repository root:

```bash
pre-commit install
```

This enables automatic checks on each commit.

## Project Layout

- `azure-vm/`: Terraform code for an Azure Linux VM and related networking.
- `.pre-commit-config.yaml`: Runs `terraform_fmt` and `terraform_validate`.

## Local Development Workflow

1. Create a feature branch from `development`.
2. Update Terraform code in `azure-vm/`.
3. Initialize Terraform:

```bash
cd azure-vm
terraform init
```

4. Format and validate before committing:

```bash
terraform fmt -recursive
terraform validate
```

5. Run hooks manually (optional but recommended):

```bash
pre-commit run --all-files
```

6. Commit and push your branch.
7. Open a pull request into `development`.

## Azure Authentication

Use one of the following approaches before running `plan` or `apply`:

1. Azure CLI login:

```bash
az login
az account set --subscription <subscription-id>
```

2. Service principal environment variables:

```bash
export ARM_CLIENT_ID=<client-id>
export ARM_CLIENT_SECRET=<client-secret>
export ARM_SUBSCRIPTION_ID=<subscription-id>
export ARM_TENANT_ID=<tenant-id>
```

(For PowerShell, use `$env:ARM_CLIENT_ID = "..."` style equivalents.)

## Variables and Secrets

`admin_ssh_public_key` is required.

Create a local variable file in `azure-vm/` (not committed, covered by `.gitignore`):

```hcl
# azure-vm/dev.auto.tfvars
admin_ssh_public_key = "ssh-ed25519 AAAA... you@example"
allowed_ssh_source_cidr = "203.0.113.10/32"
tags = {
  environment = "dev"
  owner       = "your-name"
}
```

## Pull Request Expectations

Please keep pull requests focused and include:

1. A clear summary of what changed
2. Why the change is needed
3. Any manual validation steps (`terraform validate`, `pre-commit run --all-files`, etc.)
4. Screenshots or output snippets only when relevant

## Commit Style

Use clear, descriptive commit messages. Small, focused commits are preferred over large mixed changes.

## Troubleshooting

- `terraform_validate` fails before `init`: run `terraform init` in `azure-vm/`.
- pre-commit command not found: ensure `pipx` binaries are on your `PATH` (restart terminal after `pipx ensurepath`).
- Azure auth errors: re-run `az login` or verify `ARM_*` values.
