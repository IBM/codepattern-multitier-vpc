# Generated by buildIT
# Create instances in webapp subnet in zone1
resource "ibm_is_instance" "webappserver-zone1" {
  name    = "${format(var.webappserver-name, count.index + 1)}-${var.zone1}"
  vpc     = var.vpc-id
  zone    = var.zone1
  profile = var.profile-webappserver
  image   = var.image
  boot_volume {
    name = "webappserver-zone1-boot"
  }
  keys = [var.sshkey-id]
  primary_network_interface {
    name            = "webappserver-zone1-primary"
    subnet          = var.webapptier-subnet-zone1-id
    security_groups = [var.webapptier-securitygroup-id, var.maintenance-securitygroup-id]
  }
  user_data      = data.template_cloudinit_config.cloudinit-webapptier.rendered
  resource_group = var.group-id
  count          = var.webappserver-count
}
# Create instances in webapp subnet in zone2
resource "ibm_is_instance" "webappserver-zone2" {
  name    = "${format(var.webappserver-name, count.index + 1)}-${var.zone2}"
  vpc     = var.vpc-id
  zone    = var.zone2
  profile = var.profile-webappserver
  image   = var.image
  boot_volume {
    name = "webappserver-zone2-boot"
  }
  keys = [var.sshkey-id]
  primary_network_interface {
    name            = "webappserver-zone2-primary"
    subnet          = var.webapptier-subnet-zone2-id
    security_groups = [var.webapptier-securitygroup-id, var.maintenance-securitygroup-id]
  }
  user_data      = data.template_cloudinit_config.cloudinit-webapptier.rendered
  resource_group = var.group-id
  count          = var.webappserver-count
}
# Assign Floating IPs to instances of Web Servers in zone1
resource "ibm_is_floating_ip" "webappserver-zone1-fip" {
  name           = format("%s-%s-fip", format(var.webappserver-name, count.index + 1), var.zone1)
  target         = element(ibm_is_instance.webappserver-zone1.*.primary_network_interface.0.id, count.index)
  resource_group = var.group-id
  count          = var.webappserver-count
}
# Assign Floating IPs to instances of Web Servers in zone2
resource "ibm_is_floating_ip" "webappserver-zone2-fip" {
  name           = format("%s-%s-fip", format(var.webappserver-name, count.index + 1), var.zone2)
  target         = element(ibm_is_instance.webappserver-zone2.*.primary_network_interface.0.id, count.index)
  resource_group = var.group-id
  count          = var.webappserver-count
}
