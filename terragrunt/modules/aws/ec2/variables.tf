variable "vm_name" {
  type = list(string)
}

variable "instance_type" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "aws_security_group_id" {
  type = string
}

variable "region" {
  type = string
}