resource "aws_internet_gateway" "django-ig" {
  vpc_id = aws_vpc.django.id

  tags = {
    Name = "${var.environment}-ig"
  }
}