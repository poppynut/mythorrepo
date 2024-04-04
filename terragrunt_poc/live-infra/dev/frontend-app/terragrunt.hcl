# stage/mysql/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/ec2-instance"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  instance_type = "t2.micro"
  instance_name = "example-server-thorev"
  ami = "ami-09298640a92b2d12c"
  subnet_id = dependency.vpc.outputs.public_subnets[0]

  tags = {
    Name = "example-server-thorev"
  }
}

# # Include shared root configurations

# include {
#   path = "../terragrunt.hcl"
# }