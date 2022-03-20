output "vpc_attributes" {
    value = aws_vpc.django
}

output "public_subnet_id" {
    value = aws_subnet.django-public.*.id
}