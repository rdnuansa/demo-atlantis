output "subnet_id" {
  value = aws_subnet.main_subnet.id
}

output "aws_security_group_id" {
  value = aws_security_group.main_sg.id
}
