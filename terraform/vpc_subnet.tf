resource "aws_subnet" "public" {
  vpc_id                              = aws_vpc.main.id
  cidr_block                          = "10.10.10.0/28"
  availability_zone                   = "ap-northeast-1a"
  map_public_ip_on_launch             = false
  private_dns_hostname_type_on_launch = "ip-name"

  tags = {
    ManagedBy = "Terraform"
    Name      = "For_Terraform_import_demo-subnet-public1-ap-northeast-1a"
    Project   = "terraform-import"
  }
}
