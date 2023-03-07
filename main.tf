provider "aws" {
  region = "us-west-2"
}

# EC2 Instances
resource "aws_instance" "awx" {
  ami                         = "ami-09195cb76ab892888"
  instance_type               = "t3.large"
  user_data                   = templatefile("${path.module}/templates/user_data.sh", {})
  key_name                    = "wwt-hattont-workmac"
  associate_public_ip_address = true

  security_groups = [aws_security_group.awx_sg.name]

  tags = {
    Name = "AWX"
  }
}


resource "aws_security_group" "awx_sg" {
  name        = "awx_sg"
  description = "Security group for AWX"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8043
    to_port     = 8043
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
