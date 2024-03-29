# Generated by buildIT
# Retrieve CIS instance data
resource "ibm_cis" "cis-instance" {
  name              = var.cis-instance-name
  plan              = "standard"
  location          = "global"
  resource_group_id = var.group-id
}
# Define CIS domains
resource "ibm_cis_domain" "cis-instance-domain" {
  domain = var.domain
  cis_id = ibm_cis.cis-instance.id
}
# Define CIS health checks for nginx
resource "ibm_cis_healthcheck" "root" {
  cis_id         = ibm_cis.cis-instance.id
  expected_body  = ""
  expected_codes = "200"
  path           = "/nginx_status"
  description    = "Websiteroot"
}
# Create pool (of one) with VPC LBaaS instances using URL
resource "ibm_cis_origin_pool" "vpc-lbaas" {
  name   = "${var.vpc-name}-webtier-lb"
  cis_id = ibm_cis.cis-instance.id
  origins {
    name    = "${var.vpc-name}-webtier-lbaas-1"
    address = ibm_is_lb.webapptier-lb.hostname
    enabled = "true"
  }
  check_regions = ["NAF"]
  enabled       = "true"
  monitor       = ibm_cis_healthcheck.root.id
}
# Define GLB name advertised by DNS for the website: prefix + domain, and enable DDOS
resource "ibm_cis_global_load_balancer" "glb" {
  name             = "${var.dns-name}${var.domain}"
  domain_id        = ibm_cis_domain.cis-instance-domain.id
  cis_id           = ibm_cis.cis-instance.id
  fallback_pool_id = ibm_cis_origin_pool.vpc-lbaas.id
  default_pool_ids = [ibm_cis_origin_pool.vpc-lbaas.id]
  proxied          = "true"
  session_affinity = "cookie"
  description      = "Global Load Balancer for webappdemo"
}
