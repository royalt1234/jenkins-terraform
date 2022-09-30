# The entire section create a certiface, public zone, and validate the certificate using DNS method

# Create the certificate using a wildcard for all the domains created 
resource "aws_acm_certificate" "alpha" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"
}

# calling the hosted zone
data "aws_route53_zone" "alpha" {
  name         = var.domain_name
  private_zone = var.private_zone
}

# selecting validation method
resource "aws_route53_record" "alpha" {
  for_each = {
    for dvo in aws_acm_certificate.alpha.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.alpha.zone_id
}

# validate the certificate through DNS method
resource "aws_acm_certificate_validation" "alpha" {
  certificate_arn         = aws_acm_certificate.alpha.arn
  validation_record_fqdns = [for record in aws_route53_record.alpha : record.fqdn]
}

# create records for tooling
resource "aws_route53_record" "jenkins" {
  zone_id = data.aws_route53_zone.alpha.zone_id
  name    = var.sub_domain
  type    = "A"

  alias {
    name                   = aws_lb.alpha-lb.dns_name
    zone_id                = aws_lb.alpha-lb.zone_id
    evaluate_target_health = true
  }
}