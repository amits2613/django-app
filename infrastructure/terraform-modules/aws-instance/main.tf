resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = var.vpc_security_group_ids 
  subnet_id = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.django_profile.id = 
  user_data = var.user_data

  provisioner "file" {
    source      = "${path.root}/manifests/"
    destination = "/tmp/manifests"
  }


  tags = {
    Name = "${var.environment}-instance"
  }
}

resource "tls_private_key" "private_key" {
  algorithm   = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "${var.environment}-key"
  public_key = tls_private_key.private_key.public_key_openssh
}


resource "aws_iam_instance_profile" "django_profile" {
  name = "${var.environment}-instance-profile"
  role = aws_iam_role.role.name
}



