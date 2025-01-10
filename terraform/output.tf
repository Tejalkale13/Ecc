output "vpc_id" {
    value = module.vpc.vpc_id
  
}
output "public_subnet_ids" {
    value = module.subnets.public_subnet_ids
  
}
output "private_subnet_ids" {
    value = module.subnets.private_subnet_ids
  
}
output "load_balancer_dns" {
  description = "The DNS name of the load balancer."
  value       = module.alb.load_balancer_dns
}
