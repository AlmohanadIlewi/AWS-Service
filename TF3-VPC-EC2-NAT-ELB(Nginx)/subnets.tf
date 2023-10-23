
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.cidr_a
  availability_zone = local.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = "TF Subnet A"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.cidr_b
  availability_zone = local.az_b
  map_public_ip_on_launch = true

  tags = {
    Name = "TF Subnet B"
  }
}
resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.cidr_c
  availability_zone = local.az_c
  map_public_ip_on_launch = true

  tags = {
    Name = "TF Subnet C"
  }
}