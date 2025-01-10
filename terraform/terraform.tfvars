# terraform.tfvars

vpc_cidr_block        = "192.168.0.0/16"
environment           = "development"
owner                 = "tejal"
ami_id                = "ami-080e1f13689e07408"
instance_type         = "t2.micro"
region                = "us-east-1"
private_subnet_name   = ["app-subnet", "data-subnet"]
key_name              = "keypair" // use your key name

