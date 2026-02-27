🚀 Azure Infrastructure Deployment using Terraform (Modular Architecture)
📌 Project Overview

This project provisions a production-style Azure infrastructure using a modular Terraform approach.
It demonstrates Infrastructure as Code (IaC) best practices with environment-based deployment and secure network architecture.

The infrastructure includes:

Resource Groups

Virtual Network & Subnets

Network Security Groups (NSG)

Virtual Machines

Azure Bastion for secure administrative access

Public Load Balancer for application traffic

Modular Terraform structure

Environment separation (Dev / Prod ready)

🏗 Architecture Design
🔹 Application Traffic Flow
User (Internet)
      ↓
Public IP
      ↓
Azure Load Balancer (Public)
      ↓
Backend Pool
      ↓
Virtual Machines (Private IP only)
🔹 Administrative Access Flow
Admin
   ↓
Azure Bastion
   ↓
Virtual Machines (SSH / RDP)
🔐 Security Highlights

No Public IP assigned to Virtual Machines

Secure SSH/RDP access via Azure Bastion

Network Security Groups applied at subnet level

Standard SKU Load Balancer for high availability

Segregated subnets for controlled network traffic

📂 Project Structure
azure-terraform-modular-infra/
│
├── modules/
│   ├── rg/
│   ├── vnet/
│   ├── nsg/
│   ├── nic/
│   ├── vm/
│   ├── lb/
│   └── bastion/
│
├── env/
│   ├── dev/
│   └── prod/
│
├── README.md
└── .gitignore
🛠 Technologies Used

Terraform

Microsoft Azure

Infrastructure as Code (IaC)

Modular Design Pattern

⚙ Deployment Steps
1️⃣ Initialize Terraform
terraform init
2️⃣ Validate Configuration
terraform validate
3️⃣ Plan Deployment
terraform plan
4️⃣ Apply Infrastructure
terraform apply
🎯 Key Learning Outcomes

Implemented modular Terraform architecture

Designed secure Azure networking

Integrated Load Balancer with backend pool association

Configured Azure Bastion for secure VM access

Followed environment-based deployment strategy

📈 Future Enhancements

Add Remote Backend (Azure Storage)

Implement CI/CD pipeline (Azure DevOps / GitHub Actions)

Add Auto Scaling (VMSS)

Integrate Monitoring (Azure Monitor / Log Analytics)

👨‍💻 Author

Kapil Shrivastava
DevOps & Cloud Enthusiast