resource "aws_instance" "default" {
  count         = length(var.vm_name)
  ami           = "ami-05c8486d62efc5d07"
  instance_type = var.instance_type[count.index]
  tags = {
    Name = var.vm_name[count.index]
  }

  key_name = data.aws_key_pair.demo_deployer.key_name

  network_interface {
    network_interface_id = aws_network_interface.default_interface.id
    device_index         = 0
  }
}

resource "aws_network_interface" "default_interface" {
  subnet_id = var.subnet_id
  security_groups = [ var.aws_security_group_id ]
}