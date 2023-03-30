resource "aws_vpc" "sandbox_vpc" {
  cidr_block = "10.32.0.0/24"
  tags = {
    "Name" = "vpc-sandbox"
  }
}

resource "aws_subnet" "sandbox_subnet" {
  vpc_id     = aws_vpc.sandbox_vpc.id
  cidr_block = "10.32.0.0/24"
  tags = {
    "Name" = "subnet-sandbox"
  }
}

resource "aws_network_interface" "default_interface" {
  subnet_id = aws_subnet.sandbox_subnet.id
  security_groups = [ aws_security_group.sg_test_sandbox.id ]
}

resource "aws_security_group" "sg_test_sandbox" {
  name        = "allow-web"
  description = "Allow SSH, and HTTP"

  vpc_id = aws_vpc.sandbox_vpc.id

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
