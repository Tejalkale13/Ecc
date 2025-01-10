# Define the VPC module
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block # Pass the variable to the module
  environment    = var.environment
  owner          = var.owner
}
# Define the subnet module
module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id
  vpc_cidr_block       = var.vpc_cidr_block
  private_subnet_names = var.private_subnet_name # List of public subnet names
}
module "security_group" {
  source                     = "./modules/security_group"
  vpc_id                     = module.vpc.vpc_id # Assuming you have already created the VPC
  security_group_name        = "example-security-group"
  security_group_description = "Example security group allowing ports 80, 4000, 8080, 9000, 443"
}
# Define EC2 Public Instance
module "ec2_public_instance" {
  source                 = "./modules/ec2-instance"
  subnet_id              = module.subnets.public_subnet_ids
  security_group_id      = module.security_group.security_group_id
  key_name               = var.key_name
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  public_instance_status = 0
}

module "alb" {
  source           = "./modules/alb"

  name             = var.name 
  subnets          = module.subnets.public_subnet_ids
  vpc_id           = module.vpc.vpc_id
  ec2_instance_ids = module.instance_ids



}


