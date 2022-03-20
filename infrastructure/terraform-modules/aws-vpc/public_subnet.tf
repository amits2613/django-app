resource "aws_subnet" "django-public" {
  count             = local.public_subnet_count
  vpc_id            = aws_vpc.django.id
  availability_zone = element(local.availability_zones, count.index)

  cidr_block = cidrsubnet(
    signum(length(var.vpc_cidr_block)) == 1 ? var.vpc_cidr_block : "10.10.0.0/20",
    ceil(log(local.public_subnet_count * 2, 2)),
    count.index + 2
  )

  tags = {
      "Name" = format("%s-%s", "subnet", element(local.availability_zones, count.index))
}
}

resource "aws_route_table" "rt-public" {
  
  vpc_id   = aws_vpc.django.id
  tags = {
    Name        = "${var.environment}-public-route-table"
    Environment = var.environment
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.rt-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.django-ig.id

}

resource "aws_route_table_association" "public-rt-association" {
  count = local.availability_zones_count
  subnet_id      = element(aws_subnet.django-public.*.id, count.index)
  route_table_id = aws_route_table.rt-public.id
}