variable "environment" {
    type = string
    default = "django"
}

variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "vpc_security_group_ids" {
    description = "security groups id"
}

variable "subnet_id" {
    default = "subnet id where instance will launch"
}