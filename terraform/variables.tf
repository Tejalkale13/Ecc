
# variables.tf

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "private_subnet_name" {
  description = "List of names for private subnets"
  type        = list(string)
}

variable "environment" {
  description = "Environment tag value"
}

variable "owner" {
  description = "Owner tag value"
}

variable "ami_id" {
  description = "AMI ID for the instances"
}

variable "instance_type" {
  description = "Instance type for the instances"
}





variable "key_name" {
  description = "Name of the key pair to use for SSH access"
}


variable "region" {
  description = "Name of the region"
}

variable "name" {
  description = "The name of the load balancer."
  type        = string
}

/*variable "security_group" {
  description = "List of security group IDs to associate with the load balancer."
  type        = list(string)
}*/

variable "subnets" {
  description = "List of subnet IDs where the load balancer will be deployed."
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the load balancer will be created."
  type        = string
}


