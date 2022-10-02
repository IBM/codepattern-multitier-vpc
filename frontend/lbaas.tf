# Generated by buildIT
# Define webapptier LB for zone1 and zone2
resource "ibm_is_lb" "webapptier-lb" {
  name           = "${var.vpc-name}-webapptier01-lb"
  subnets        = [var.webapptier-subnet-zone1-id, var.webapptier-subnet-zone2-id]
  type           = "public"
  resource_group = var.group-id
}
# Define webapptier LB listener
resource "ibm_is_lb_listener" "webapptier-lb-listener" {
  lb           = ibm_is_lb.webapptier-lb.id
  port         = 80
  protocol     = "http"
  default_pool = element(split("/", ibm_is_lb_pool.webapptier-lb-pool.id), 1)
}
# Define webapptier LB pool
resource "ibm_is_lb_pool" "webapptier-lb-pool" {
  name               = "${var.vpc-name}-webapptier-lb-pool1"
  lb                 = ibm_is_lb.webapptier-lb.id
  algorithm          = var.webapptier-lb-algorithm
  protocol           = "http"
  health_delay       = 5
  health_retries     = 2
  health_timeout     = 2
  health_type        = "http"
  health_monitor_url = "/"
}
# Define webapptier LB pool member in zone1
resource "ibm_is_lb_pool_member" "webapptier-lb-pool-member-zone1" {
  pool           = element(split("/", ibm_is_lb_pool.webapptier-lb-pool.id), 1)
  lb             = ibm_is_lb.webapptier-lb.id
  port           = 80
  target_address = element(ibm_is_instance.webappserver-zone1.*.primary_network_interface.0.primary_ipv4_address, count.index)
  count          = length(ibm_is_instance.webappserver-zone1)
}
# Define webapptier LB pool member in zone2
resource "ibm_is_lb_pool_member" "webapptier-lb-pool-member-zone2" {
  pool           = element(split("/", ibm_is_lb_pool.webapptier-lb-pool.id), 1)
  lb             = ibm_is_lb.webapptier-lb.id
  port           = 80
  target_address = element(ibm_is_instance.webappserver-zone2.*.primary_network_interface.0.primary_ipv4_address, count.index)
  count          = length(ibm_is_instance.webappserver-zone2)
}
