# Azure Infrastructure Automation: Bicep & CI/CD Blueprint

This repository contains a **production-ready infrastructure-as-code (IaC) solution** for deploying secure and scalable resources on Microsoft Azure. It demonstrates best practices in automation, security hardening, and multi-stage CI/CD pipelines.

## 🚀 Overview
The goal of this project is to automate the deployment of a secure cloud environment. It follows a modular approach using **Azure Bicep**, ensuring that infrastructure is versioned, repeatable, and easily maintainable.

### Key Features:
* **Modular IaC:** Reusable Bicep templates for Storage Accounts, Service Bus, and App Services.
* **Security-First Approach:** Integrated **Azure Key Vault** for automated secret management and secure storage of connection strings.
* **Automated Logic:** Custom scripting (Bash/Python) to dynamically retrieve and inject credentials without human intervention.
* **Full CI/CD Lifecycle:** Multi-stage YAML pipelines for validation, build, and automated release.

## 🏗️ Architecture
The deployment consists of the following components:
* **Compute:** Linux-based App Service Plan (F1/B1) and App Service.
* **Messaging & Storage:** Service Bus and Storage Account.
* **Security:** Azure Key Vault for managing sensitive connection strings.
* **Automation:** Azure DevOps YAML pipelines.

## 🛠️ Tech Stack
* **Provider:** Microsoft Azure
* **IaC:** Bicep
* **CI/CD:** Azure DevOps Pipelines (YAML)
* **Scripting:** Bash / Python / PowerShell
* **Security:** Azure Key Vault & RBAC

## 📂 Project Structure
* `/infrastructure-as-code`: Contains all Bicep modules and main deployment files.
* `/cicd-pipelines`: Multi-stage YAML definitions for Build and Release processes.

## ⚙️ How it Works
1. **Validation:** The pipeline runs a Bicep linting and "What-If" analysis.
2. **Infrastructure Deployment:** Azure resources are provisioned following the least-privilege principle.
3. **Secret Injection:** Scripts fetch connection strings and store them in Azure Key Vault.
4. **Application Release:** The build artifact is deployed to the Linux App Service.

## 👨‍💻 Author
**Mauricio Batista** | *Systems Engineer & DevSecOps Specialist*
[LinkedIn Profile](https://www.linkedin.com/in/mauriciobatista30/)
