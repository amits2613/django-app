variable "environment" {
  description = "Name of environment"
}

variable "vpc_cidr_block" {
  type = string
}

variable "max_subnet_count" {
  type = number
}

variable "to_port" {
  type = number
}

variable "from_port" {
  type = number
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

###### AWS ECR parameters
variable "ecr_repositories" {
  type = list(string)
}

variable "hosted_zone_name" {
    type = string
}

variable "record_name" {
    type = string
}

variable "record_type" {
    type = string
}

