module "myvpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name 
  cidr = var.vpc-cidr

  azs             = [local.az_a,local.az_b]
  private_subnets = var.private-subnets
  public_subnets  = var.public-subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}