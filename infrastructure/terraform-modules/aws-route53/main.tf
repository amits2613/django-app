resource "aws_route53_zone" "django" {
  name = var.hosted_zone_name
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.django.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = "300"
  records = [var.records]
}