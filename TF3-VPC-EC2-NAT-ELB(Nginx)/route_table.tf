# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "rt" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0" # Das gesamte Internet
gateway_id = aws_internet_gateway.gw.id # Link zu unserem erstellten Internet Gateway
}

tags = {
Name = "TF Route Table"
}
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "a" {
subnet_id      = aws_subnet.subnet_a.id
route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
subnet_id      = aws_subnet.subnet_b.id
route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "c" {
subnet_id      = aws_subnet.subnet_c.id
route_table_id = aws_route_table.rt.id
}
