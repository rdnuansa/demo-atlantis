resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block
  tags = {
    "Name" = var.subnet_name
  }
}

resource "aws_security_group" "main_sg" {
  name        = var.security_groups_name
  description = "Allow SSH, and HTTP"

  vpc_id = aws_vpc.main_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}
