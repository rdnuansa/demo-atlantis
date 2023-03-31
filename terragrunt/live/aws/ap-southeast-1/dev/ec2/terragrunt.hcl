terraform {
  source = "../../../../../modules/aws/ec2/"
}

inputs = {
  vm_name               = ["${include.environment.inputs.environment_name}-app"]
  instance_type         = ["t2.micro"]
  subnet_id             = dependency.vpc.outputs.subnet_id
  aws_security_group_id = dependency.vpc.outputs.aws_security_group_id
  region                = "${include.region.inputs.region}"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    aws_security_group_id = "DUMMY_VPC_ID"
    subnet_id             = "DUMMY_SUBNET_ID"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]  
}

include "environment" {
  path   = find_in_parent_folders("environment.hcl")
  expose = true
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

