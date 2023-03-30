terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "test-sandbox-tfstate"
    key    = "sandbox"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "default" {
  count         = length(var.vm_name)
  ami           = "ami-05c8486d62efc5d07"
  instance_type = "t2.micro"
  tags = {
    Name = var.vm_name[count.index]
  }

  key_name = aws_key_pair.deployer.key_name

  network_interface {
    network_interface_id = aws_network_interface.default_interface.id
    device_index = 0
  }
  
}

resource "aws_key_pair" "deployer" {
  key_name   = "test-admin"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDp8U/vOSmFWxQYyw4DH7ea99gfwhk+8gaz8hm7+cxpf+FPgrGpGJVIyIy7tQLNDzqQOyq+rh42FHLSMekdLUABUeGZb1n6Un443wVQG7qKPbMYA9PniCA/lauXblwy3tQB1CDocwzOmjDdD64robSR7fB8KU7PpZEYzaoapwd++hW6JXeFIsT/RuxdQ2rDez0bA8s76ZpPzlC290SQXD+Bfe+svJ//oYr5YrwL/Z2k/w+KV44m/CpDM+FOJWR+2elA2EUdeKK4ElARAQWW2wJyKLjlDMLtcQvnqxIY7rAMEmkfRpHaWsDpaUSYDTPqxzmBZ1A388OxQ9uWuFBds/3cv2QvA/jCPopFme3Fb/Ho3DWCSjkVIlYEP2e3PNAw88t3ado03o0pMFpzqVKkbVGaYxhgCV5RatE0JDysaIaY+MJEMwGD0lUQFY2GC7R7ZmjHIjAzys81tQKddGX647cMxEJi+x0YNKSAvtIgXjoK5ySvw0RVyLx7etkyUacykBk= ryandito@accelbyte.net@Ryandito-AB-LInux"
}
