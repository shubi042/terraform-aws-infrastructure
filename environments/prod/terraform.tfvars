project_name = "myapp"
environment  = "prod"
aws_region   = "us-east-1"

vpc_cidr             = "10.1.0.0/16"
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]

instance_type        = "t3.small"
asg_min_size         = 2
asg_max_size         = 6
asg_desired_capacity = 2

db_name           = "appdb"
db_username       = "admin"
db_password       = "REPLACE_WITH_SECRETS_MANAGER"
db_instance_class = "db.t3.small"