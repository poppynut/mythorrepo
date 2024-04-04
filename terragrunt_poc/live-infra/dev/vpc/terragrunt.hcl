# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand
# notation.
# include "root" {
#   path = find_in_parent_folders()
# }

# stage/mysql/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/vpc"
}

# Indicate the input values to use for the variables of the module.
inputs = {
  name = "hmcl-thor-dreamcatcher-vpc"
  cidr = "10.60.3.0/25"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.60.3.0/27", "10.60.3.32/27"]
  public_subnets  = ["10.60.3.64/27", "10.60.3.96/27"]
  

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Terragrunt = "true"
    Environment = "test"
  }
}