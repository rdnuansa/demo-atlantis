output "webserver_dns" {
  value = aws_instance.default[*].private_dns
}

output "webserver_private_ip" {
  value = aws_instance.default[*].private_ip
}