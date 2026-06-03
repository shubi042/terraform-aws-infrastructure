# Terraform AWS Infrastructure

Multi-environment AWS infrastructure provisioned with Terraform. Covers networking (VPC, subnets, IGW, NAT), compute (EC2 Auto Scaling + ALB), and database (RDS MySQL) across `dev` and `prod` environments.

## Architecture

```
.
├── main.tf                      # Root module wiring
├── variables.tf
├── outputs.tf
├── modules/
│   ├── vpc/                     # VPC, subnets, IGW, NAT, route tables
│   ├── ec2/                     # Launch template, ASG, ALB, CloudWatch alarms
│   └── rds/                     # RDS MySQL, subnet group, security group
└── environments/
    ├── dev/terraform.tfvars
    └── prod/terraform.tfvars
```

## Prerequisites

- Terraform >= 1.5
- AWS CLI configured (`aws configure`)
- S3 bucket + DynamoDB table for remote state (update `backend` block in `main.tf`)

## Usage

```bash
terraform init
terraform plan  -var-file=environments/dev/terraform.tfvars
terraform apply -var-file=environments/dev/terraform.tfvars
```

## CI/CD

GitHub Actions (`.github/workflows/terraform.yml`) runs `fmt`, `validate`, and `plan` on every PR. Apply triggers only on merge to `main`.

## Modules

| Module | Key Resources |
|--------|---------------|
| `vpc`  | VPC, public/private subnets (multi-AZ), IGW, NAT gateways, route tables |
| `ec2`  | Launch template, Auto Scaling Group, ALB, target group, CPU scale-up alarm |
| `rds`  | RDS MySQL 8.0, encrypted storage, automated backups, subnet + security group |