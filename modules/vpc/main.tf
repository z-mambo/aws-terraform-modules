resource "aws_vpc" "keenVpc" {
  cidr_block       = var.keenVpcCidr
  instance_tenancy = "default"

  tags = {
    Name = "keenVpc"
  }
}

resource "aws_subnet" "pubSn" {
  vpc_id     = aws_vpc.keenVpc.id
  cidr_block = var.pubSnCidr

  tags = {
    Name = "pubSn"
  }
}

resource "aws_subnet" "privSn" {
  vpc_id     = aws_vpc.keenVpc.id
  cidr_block = var.privSnCidr

  tags = {
    Name = "privbSn"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.keenVpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "pubRt" {
  vpc_id = aws_vpc.keenVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pubRt"
  }
}

resource "aws_route_table_association" "rtTbAssoPubSn" {
  subnet_id      = aws_subnet.pubSn.id
  route_table_id = aws_route_table.pubRt.id
}
