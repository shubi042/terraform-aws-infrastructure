project_name = "myapp"
environment  = "dev"
aws_region   = "us-east-1"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

instance_type        = "t3.micro"
asg_min_size         = 1
asg_max_size         = 2
asg_desired_capacity = 1

db_name           = "appdb"
db_username       = "admin"
db_password       = "REPLACE_WITH_SECRETS_MANAGER"
db_instance_class = "db.t3.micro"