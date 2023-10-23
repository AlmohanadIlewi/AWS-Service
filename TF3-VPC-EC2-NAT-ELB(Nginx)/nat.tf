# Erstellen Elastic IPs für die NAT Gateways
resource "aws_eip" "nat_eip" {
  count = length([local.az_a, local.az_b, local.az_c])
}

# Erstellen NAT Gateways in jedem Subnetz
resource "aws_nat_gateway" "nat_gateway" {
  count = length([local.az_a, local.az_b, local.az_c])

  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.private_subnets[count.index].id

  tags = {
    Name = "TF NAT Gateway ${element([local.az_a, local.az_b, local.az_c], count.index)}"
  }
}

# Erstellen private Subnetze
resource "aws_subnet" "private_subnets" {
  count = length([local.az_a, local.az_b, local.az_c])

  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 10}.0/24"
  availability_zone = element([local.az_a, local.az_b, local.az_c], count.index)

  tags = {
    Name = "TF Private Subnet ${element([local.az_a, local.az_b, local.az_c], count.index)}"
  }
}

# Erstellen Routing-Tabellen für private Subnetze
resource "aws_route_table" "private_route_tables" {
  count = length([local.az_a, local.az_b, local.az_c])

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF Private Route Table ${element([local.az_a, local.az_b, local.az_c], count.index)}"
  }
}

# hinzufügen Routen, um den Datenverkehr über die NAT Gateways zu leiten
resource "aws_route" "private_subnet_routes" {
  count = length([local.az_a, local.az_b, local.az_c])

  route_table_id         = aws_route_table.private_route_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway[count.index].id
}

# hinzufüge Subnetze zu ihren jeweiligen Routen
resource "aws_route_table_association" "private_subnet_association" {
  count = length([local.az_a, local.az_b, local.az_c])

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_tables[count.index].id
}

# ...



