data "template_cloudinit_config" "cloudinit-webapptier" {
  base64_encode = false
  gzip          = false

  part {
    content = <<EOF
#cloud-config
package_update: true
package_upgrade: true
packages:
 - nginx
 - mysql-client
 - php
 - php-fpm
 - php-mysqlnd
 - unit
 - unit-php
 - unit-dev
 - unit-jsc-common
 - unit-jsc8
 - unit-php

runcmd:
 - /bin/systemctl enable nginx
 - /bin/systemctl enable php-fpm
 - /bin/firewall-cmd --add-port=80/tcp --permanant

power_state:
 mode: reboot
 message: Rebooting server now.
 timeout: 30
 condition: True
 
EOF

  }
}
