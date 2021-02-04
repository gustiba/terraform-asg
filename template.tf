resource "aws_launch_template" "templateApache" {
  name = "templateApache"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 8
    }
  }

  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }

  disable_api_termination = true

  image_id = "ami-0c20b8b385217763f"

  instance_type = "t2.micro"

  key_name = "jcde-key"

  network_interfaces {
    associate_public_ip_address = true
  }

  placement {
    availability_zone = "ap-southeast-1a"
  }

  vpc_security_group_ids = [aws_security_group.tf-allow-http.id, aws_security_group.tf-allow-ssh.id]

  tag_specifications {
    resource_type = "instance"

    
  }

  user_data = <<-EOF
                #! /bin/bash
                sudo apt update
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo systemctl enable apache2
                sudo rm -rf /var/www/html/*
                echo "================================= CLONE TEMPLATE FROM GITHUB ============================="
                sudo git clone https://github.com/hisbu/template2.git /var/www/html/
                echo "================================= add hostname ============================="
                sudo sed -i -e '1 i\<center>'$(hostname -f)'</center>' /var/www/html/index.html
                EOF 
}