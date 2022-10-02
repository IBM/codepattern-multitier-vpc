data "template_cloudinit_config" "cloudinit-dbtier" {
  base64_encode = false
  gzip          = false

  part {
    content = <<EOF
#cloud-config
package_update: true
package_upgrade: true
packages:
 - mysql-server
 - mysql-devel
 - python39
 - python39-devel
 - python39-pip
 - python39-PyMySQL

runcmd:
 - /bin/systemctl enable mysqld

power_state:
 mode: reboot
 message: Rebooting server now.
 timeout: 30
 condition: True
 
EOF

  }
}
