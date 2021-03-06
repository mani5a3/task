module "test-app-server" {
  source = "../../modules/ec2"
  ami                  = "ami-0c4f7023847b90238"
  instance_type        = "t2.micro"
  vpc_security_group_ids = [module.test-sg.sg_id]
  subnet_id             = "subnet-0c2b8303bcfcc73dd"
  key_name             = "task"
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
apt-get update
apt-get install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
echo "<?php
phpinfo();" > /var/www/html/info.php
sudo service apache2 restart
EOF
  tags = {
  Name = "test-app-server"
  } 
}