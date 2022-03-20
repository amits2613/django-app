
vpc_cidr_block = "10.10.0.0/20"

environment = "practice"
max_subnet_count = 1
to_port = 65535
from_port = 0 

ecr_repositories = ["django-helloworld-app"]

ami_id = "ami-slkj56638s"
instance_type = "t2.micro"

hosted_zone_name = "amit.com"
record_name = "django.amit.com"
record_type = "A"