variable "aws_region"   { type = string; default = "us-east-1" }
variable "project_name" { type = string }
variable "environment" {
  type = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be dev, staging, or prod."
  }
}
variable "vpc_cidr"             { type = string; default = "10.0.0.0/16" }
variable "public_subnet_cidrs"  { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "availability_zones"   { type = list(string) }
variable "instance_type"        { type = string; default = "t3.micro" }
variable "asg_min_size"         { type = number; default = 1 }
variable "asg_max_size"         { type = number; default = 4 }
variable "asg_desired_capacity" { type = number; default = 2 }
variable "db_name"              { type = string }
variable "db_username"          { type = string; sensitive = true }
variable "db_password"          { type = string; sensitive = true }
variable "db_instance_class"    { type = string; default = "db.t3.micro" }