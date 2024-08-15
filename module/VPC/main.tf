resource "aws_vpc" "imentorlly_vpc_dev_01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "imentorlly-vpc"
  }
}

resource "aws_subnet" "imentorlly_public_subnet" {
  vpc_id     = aws_vpc.imentorlly_vpc_dev_01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"  
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "imentorlly_igw" {
  vpc_id = aws_vpc.imentorlly_vpc_dev_01.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "imentorlly_public_rt" {
  vpc_id = aws_vpc.imentorlly_vpc_dev_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.imentorlly_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}
