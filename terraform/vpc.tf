resource "aws_vpc" "main" {
  cidr_block                           = "10.10.10.0/24"
  assign_generated_ipv6_cidr_block     = false
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"

  tags = {
    ManagedBy = "Terraform"
    Name      = "For_Terraform_import_demo-vpc"
    Project   = "terraform-import"
  }
}
