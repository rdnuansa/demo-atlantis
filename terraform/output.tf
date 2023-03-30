output "webserver_dns" {
  value = aws_instance.default[*].private_dns
}