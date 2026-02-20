# k8s-w-terraform-ansible
This repository contains Infrastructure as Code for provisioning a Kubernetes cluster using Terraform and Ansible. Infrastructure has not been applied in a live environment.


Kubernetes Cluster Provisioning with Terraform & Ansible
📌 Overview

This repository contains Infrastructure as Code (IaC) for provisioning and configuring a production-style Kubernetes cluster using:

Terraform for infrastructure provisioning

Ansible for configuration management and Kubernetes installation

Kubeadm for Kubernetes bootstrap

The project follows modular design and environment separation best practices.

🏗 Architecture

VPC / Networking

Security Groups

EC2 Instances (Control Plane + Workers)

Kubernetes Cluster (kubeadm)

Container runtime: containerd

CNI plugin (Flannel or Calico)

Infrastructure is defined but not applied in a live cloud environment.

🛠 Technologies Used

Terraform

Ansible

Kubernetes

Docker

GitHub Actions

📂 Project Structure

terraform/ → Infrastructure provisioning

ansible/ → Server configuration & Kubernetes setup

scripts/ → Automation helpers

.github/workflows/ → CI pipeline

🚀 Deployment Workflow
# 1. Provision infrastructure
cd terraform/environments/dev
terraform init
terraform plan
terraform apply

# 2. Generate inventory
cd ../../../
./scripts/generate_inventory.sh

# 3. Configure cluster
cd ansible
ansible-playbook -i inventory/dev.ini site.yml
🔐 Best Practices Implemented

Modular Terraform design

Environment isolation (dev/prod)

Remote backend capability

Idempotent Ansible roles

CI validation for Terraform formatting & validation

Clear separation between infrastructure and configuration

🎯 Goals of This Project

Demonstrate Infrastructure as Code best practices

Showcase Terraform modular design

Showcase Ansible role-based configuration

Simulate production-ready Kubernetes deployment architecture

📊 Future Improvements

HA control plane

Load balancer integration

Autoscaling groups

Monitoring stack (Prometheus + Grafana)

Helm-based application deployments