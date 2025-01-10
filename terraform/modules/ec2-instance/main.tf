
resource "aws_instance" "ec2_instance" {
  count                       = length(var.subnet_id)      # Create an EC2 instance for each subnet
  subnet_id                   = var.subnet_id[count.index] # Access subnet ID based on index
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_instance_status == 0 ? true : false

 
 

}
