# Security Policy

## Supported Scope

This repository contains infrastructure-as-code, GitHub Actions workflows, and Azure Function code for the Azure Failover Orchestrator demo.

## Reporting a Vulnerability

Do not create a public GitHub issue for suspected vulnerabilities.

Report security concerns through your internal security process or directly to the repository owners with:

- a short summary of the issue
- the affected file or workflow
- reproduction steps
- impact assessment
- suggested remediation if available

## Security Controls In This Repository

- OIDC-based GitHub Actions authentication to Azure, avoiding long-lived client secrets in workflows
- pull-request CI gates for Terraform, Python, and IaC security checks
- CodeQL analysis for the Python Azure Functions codebase
- dependency update automation with Dependabot
- protected deployment workflow design with GitHub Environments
