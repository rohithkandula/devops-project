resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.aws_region}a"
}

resource "aws_subnet" "private_subnet_ec2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_ec2_cidr
  availability_zone = "${var.aws_region}a"
}

resource "aws_subnet" "private_subnet_rds" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_rds_cidr
  availability_zone = "${var.aws_region}b"
}
