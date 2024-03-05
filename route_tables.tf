resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table" "private_route_table_ec2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block        = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association_ec2" {
  subnet_id      = aws_subnet.private_subnet_ec2.id
  route_table_id = aws_route_table.private_route_table_ec2.id
}

resource "aws_route_table_association" "private_subnet_association_rds" {
  subnet_id      = aws_subnet.private_subnet_rds.id
  route_table_id = aws_vpc.my_vpc.main_route_table_id
}
