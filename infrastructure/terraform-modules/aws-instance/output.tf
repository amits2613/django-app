output "instance_attributes" {
    value = aws_instance.web
}

output "iam_role_attributes" {
    value = aws_iam_role.role
}

output "private_key" {
    value = tls_private_key.private_key.private_key_pem
}