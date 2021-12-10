variable "domain_name" {
  description = "domain name to certify eg: cdn.example.com, *.example.com ..."
  type        = string
}

variable "alternative_domain_names" {
  description = "Alternative domain names"
  type        = list(string)
  default     = null
}

variable "r53_zone_id" {
  description = "Route 53 Hosted Zone Id"
}
