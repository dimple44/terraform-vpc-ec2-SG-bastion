module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"
  # insert the 3 required variables here

name = "public-bastion-sg"
description = "Security group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Block  
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags  

}