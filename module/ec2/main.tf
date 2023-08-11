resource "aws_instance" "ec2_instance" {
  count           = 3
  ami             = var.ec2_instance_ami
  instance_type   = var.ec2_instance_type
  security_groups = [aws_security_group.sg.name]
  user_data       = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1> $HOSTNAME </h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "${var.ec2_instance_name}-${count.index + 1}"    
    Env  = var.ec2_instance_env
  }
}