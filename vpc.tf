resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "21.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "terraform-vpc"
  }
}