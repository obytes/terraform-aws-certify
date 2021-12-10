module "certify" {
  source                   = "./modules/route53"
  r53_zone_id              = var.r53_zone_id
  domain_name              = var.domain_name
  alternative_domain_names = var.alternative_domain_names
}
