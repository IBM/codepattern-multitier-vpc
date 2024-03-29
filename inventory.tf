# Generated by buildIT
resource "local_file" "inventory" {
  filename = "/tmp/.schematics/hosts.ini"
  content  = <<EOT
[webapptier]
${module.frontend.webappserver-zone1-ip} 
${module.frontend.webappserver-zone2-ip}
[dbtier0]
${module.backend.dbserver-zone1-ip}
[dbtier1]
${module.backend.dbserver-zone2-ip}
EOT
}
