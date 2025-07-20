# Node.js Deployment

Continuous Deployment of Node.js Application on AWS EC2 with GitHub Actions and Ansible
This repository provides a comprehensive setup for the continuous integration and continuous deployment (CI/CD) of a Node.js application onto an AWS EC2 instance. It leverages Terraform for infrastructure provisioning, Ansible for server configuration and application deployment, and GitHub Actions to automate the entire pipeline.

🚀 Project Overview

This project automates the CI/CD workflow:

A push to the main branch on GitHub triggers the workflow.

Terraform provisions/updates an AWS EC2 instance and its Security Group (opening ports 22, 80, and 3001).

Ansible configures the EC2 instance, installs Node.js (via nodejs tag), copies the application files, and sets up a systemd service for continuous running.

The Node.js application is deployed and starts on the EC2 instance.

🛠️ Technologies Used

GitHub Actions

AWS EC2 & IAM

Terraform

Ansible

Node.js & Systemd

⚙️ Configuration

To enable the pipeline, configure AWS credentials and an SSH key in GitHub Secrets.

1. AWS Prerequisites
   
SSH Key Pair: This is needed for Ansible.

IAM User for GitHub Actions: Create a dedicated IAM user (e.g., github-actions-user) with necessary EC2 permissions. Generate Access Key ID and Secret Access Key.

2. GitHub Secrets Configuration
   
Add these secrets in your GitHub repository: Settings > Secrets and variables > Actions.

AWS_ACCESS_KEY_ID: Your AWS Access Key ID.

AWS_SECRET_ACCESS_KEY: Your AWS Secret Access Key.

ANSIBLE_SSH_PRIVATE_KEY: The entire content of your private SSH key file.

3. Terraform Configuration
   
Ensure terraform-aws/*.tf creates the EC2 instance with Name = "MyFreeTierInstance" and defines output "instance_id". The Security Group will open ports 22 (SSH), 80 (HTTP), and 3001(nodejs).

5. Ansible Configuration
   
ansible/setup.yml should include the nodejs role.

Node.js app files (app.js, package.json, etc.) are in ansible/roles/nodejs/files/codebase/.

systemd service file (nodeapp.service) is in ansible/roles/nodejs/files/service/.

Ansible Roles: Includes nginx (optional) and base (installs git, fail2ban, etc., customizable).

Ansible Inventory (ansible/hosts): Not used here, the IP is passed directly.

🚀 Running the CI/CD Pipeline

Ensure main branch is up-to-date locally.

git push origin main: Triggers the workflow. Use git commit --allow-empty -m "Trigger CI/CD workflow" for test runs without code changes.

Monitor execution: Check the Actions tab in GitHub for detailed logs.

The pipeline will provision/update EC2 and execute Ansible to deploy your Node.js application.
