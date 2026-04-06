# DevSecOps and Delivery Model

## Branching Strategy

Use a protected `main` branch with short-lived branches:

- `feature/<name>`
- `bugfix/<name>`
- `hotfix/<name>`

All changes should go through pull requests. Direct pushes to `main` should be disabled.

## Required Branch Protection

Configure `main` with:

- required pull requests before merge
- at least 2 reviewers for infrastructure or workflow changes
- required status checks:
  - `Terraform quality and IaC security`
  - `Python quality and dependency security`
  - `Container build verification`
  - `Terraform plan`
  - `Analyze Python`
- conversation resolution before merge
- stale approval dismissal on new commits
- blocked force pushes and blocked branch deletion

## Environment Promotion

Recommended GitHub Environments:

- `dev`
- `preprod`
- `production`

Suggested flow:

- pull request: validate and review Terraform plan
- merge to `main`: deploy `dev`
- manual promotion: deploy `preprod`
- approved production release: deploy `production`

## DevSecOps Controls

- GitHub OIDC to Azure with federated credentials
- protected GitHub Environments for approvals and secrets
- Terraform state in a dedicated secured storage account
- CodeQL, Bandit, tfsec, TFLint, Trivy, and dependency scanning in every pull request
- generate a CycloneDX SBOM for the deployed container image
- sign and verify container images with Cosign after push to ACR
- publish SBOM attestation for the pushed image
- upload Trivy SARIF findings into GitHub code scanning
- CODEOWNERS review on `.github/` and `infra/`
- Dependabot for GitHub Actions, Terraform, and Python dependencies

## Operational Practices

- keep infrastructure and application changes in the same pull request only when they are deployed together
- require rollback notes for production-impacting changes
- tag releases or deployments with the image SHA for traceability
- treat workflow edits as privileged changes

## Additional Platform Settings

These controls should also be enabled in GitHub because they are not fully enforced by workflow files alone:

- secret scanning
- push protection for secrets
