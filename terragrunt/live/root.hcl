generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "test-sandbox-tfstate"
    key            = "sandbox-terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}
EOF
}