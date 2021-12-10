resource "aws_acm_certificate" "_" {
  domain_name               = var.domain_name
  subject_alternative_names = var.alternative_domain_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "_" {
  certificate_arn         = aws_acm_certificate._.arn
  validation_record_fqdns = [for record in cloudflare_record._ : record.hostname]
}

resource "cloudflare_record" "_" {
  for_each = {
    for dvo in aws_acm_certificate._.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = var.cloudflare_zone_id
  proxied = false
  ttl     = 1

  name  = each.value.name
  type  = each.value.type
  value = each.value.record
}
