variable "domain_name" {
  description = "domain name to certify eg: cdn.example.com, *.example.com ..."
  type        = string
}

variable "alternative_domain_names" {
  description = "Alternative domain names"
  type        = list(string)
  default     = null
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone Id"
}
