# Node.js Deployment

Continuous Deployment of Node.js Application on AWS EC2 with GitHub Actions and Ansible.
This repository sets up a CI/CD pipeline for a Node.js application on AWS EC2 using Terraform for infrastructure, Ansible for server configuration and deployment, and GitHub Actions for automation.

#### 🚀 Project Overview

The CI/CD workflow is automated:

A push to main triggers the workflow.

Terraform provisions/updates an AWS EC2 instance and Security Group (opening ports 22, 80, and 3001).

Ansible configures the EC2 instance, installs Node.js (via nodejs tag), copies the application files, and sets up a systemd service.

The Node.js application is deployed and starts on the EC2 instance.

#### 🛠️ Technologies Used

- GitHub Actions

- AWS EC2 & IAM

- Terraform

- Ansible

- Node.js & Systemd

#### ⚙️ Configuration
To enable the pipeline, configure AWS credentials and an SSH key in GitHub Secrets.

#### Terraform Configuration
   
terraform-aws/*.tf creates the EC2 instance with Name = "MyFreeTierInstance" and defines output "instance_id".

#### Ansible Configuration
   
ansible/setup.yml include the nodejs role.

node.js app files (app.js, package.json, etc.) are in ansible/roles/nodejs/files/codebase/.

systemd service file (nodeapp.service) is in ansible/roles/nodejs/files/service/.

Ansible Roles: Includes two optionals roles : Nginx and Base.

Ansible Inventory (ansible/hosts): Used for static VMs, but not utilized here as the EC2 IP is passed directly.

#### 🚀 Running the CI/CD Pipeline

Ensure main branch is up-to-date locally.

git push origin main: Triggers the workflow. Use git commit --allow-empty -m "Trigger CI/CD workflow" for test runs.

Monitor execution: Check the Actions tab in GitHub for detailed logs.

This will start the webserver on port-3001 as mentioned in the app.js. Open the browser to validate the application running

```
http:\\<SERVER_IP>:3001
```
