resource "aws_key_pair" "deployer_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/deployer_key.pub")
}

resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet_public1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  key_name               = aws_key_pair.deployer_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "my_instance"
  }
}