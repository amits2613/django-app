output "vpc_id" {
  value = module.aws-vpc.vpc_attributes.id 
}

output "instance_public_ip" {
  value = module.aws-instance.instance_attributes.public_ip
}