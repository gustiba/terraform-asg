resource "aws_internet_gateway" "tv-igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "tv-igw"
  }
}