output "webserver_dns" {
  value = aws_instance.default[*].private_dns
}

output "webserver_ip" {
  value = aws_instance.default[*].private_ip
}