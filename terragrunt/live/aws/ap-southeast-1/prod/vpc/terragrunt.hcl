terraform {
  source = "../../../../../modules/aws/vpc/"
}

inputs = {
  vpc_name             = "${include.environment.inputs.environment_name}-vpc"
  subnet_name          = "${include.environment.inputs.environment_name}-subnet"
  security_groups_name = "${include.environment.inputs.environment_name}-security-group"
  vpc_cidr_block       = "172.16.0.0/24"
  subnet_cidr_block    = "172.16.0.0/24"
  region               = "${include.region.inputs.region}"
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
