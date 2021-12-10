# Terraform AWS Certify

Provision and auto-validate TLS certificates for domains using AWS ACM.

## Features

✅ Ability to provision certificates for one or more domains.

✅ Auto certificate validation using DNS.

✅ Support Rout53 and Cloudflare for DNS certificate validation.


## Usage

- Provision and validate a certificate using Route53

```hcl
module "certification" {
  source  = "git::https://github.com/obytes/terraform-aws-certify//modules/route53"

  r53_zone_id              = var.dns_zone_id
  domain_name              = "demo.kodhive.com"
  alternative_domain_names = ["*.demo.kodhive.com", "demo-private-media.kodhive.com"]
}
```

- Provision and validate a certificate using Cloudflare

```hcl
module "certification" {
  source  = "git::https://github.com/obytes/terraform-aws-certify//modules/cloudflare"

  cloudflare_zone_id       = var.dns_zone_id
  domain_name              = "demo.kodhive.com"
  alternative_domain_names = ["*.demo.kodhive.com", "demo-private-media.kodhive.com"]
}
```
