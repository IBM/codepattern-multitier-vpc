# Generated by buildIT
output "webappserver-zone1-id" {
  value = ibm_is_instance.webappserver-zone1[0].id
}
output "webappserver-zone2-id" {
  value = ibm_is_instance.webappserver-zone2[0].id
}
output "webappserver-zone1-ip" {
  value = ibm_is_instance.webappserver-zone1[0].primary_network_interface[0].primary_ipv4_address
}
output "webappserver-zone2-ip" {
  value = ibm_is_instance.webappserver-zone2[0].primary_network_interface[0].primary_ipv4_address
}
output "webappserver-zone1-fip" {
  value = ibm_is_floating_ip.webappserver-zone1-fip[0].address
}
output "webappserver-zone2-fip" {
  value = ibm_is_floating_ip.webappserver-zone2-fip[0].address
}
