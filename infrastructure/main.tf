data "aws_availability_zones" "available_zones" {}

module "aws-vpc" {
  source = "./terraform-modules/aws-vpc"

  vpc_cidr_block            = var.vpc_cidr_block
  aws_availability_zones    = flatten(data.aws_availability_zones.available_zones.*.names)
  max_subnet_count          = var.max_subnet_count
  environment               = var.environment
}

module "instance-securitygroup" {
  source = "./terraform-modules/aws-securitygroup"

  vpc_id            = module.aws-vpc.vpc_attributes.id  
  name              = "${var.environment}-eks-security-group"
  to_port           = var.to_port
  from_port         = var.from_port
  cidr_blocks       = module.aws-vpc.vpc_attributes.cidr_block
}

module "aws-instance" {
  source = "./terraform-modules/aws-securitygroup"

  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  vpc_security_group_ids    = module.instance-securitygroup.security-group-attributes.id
  subnet_id                 = module.aws-vpc.vpc_attributes.public.*.id
  environment               = var.environment

}

module "aws-ecr" {
  source = "./terraform-modules/aws-ecr"

  count = length(var.ecr_repositories)
  ecr_repositories = element(var.ecr_repositories, count.index)
}
