locals {  
    availability_zones_count = length(var.aws_availability_zones)
    availability_zones = var.aws_availability_zones
    public_subnet_count = var.max_subnet_count == 0 ? local.availability_zones_count : var.max_subnet_count
}