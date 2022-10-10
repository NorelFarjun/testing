provider "aws" {
}

resource "aws_vpc" "q2-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" =  "testing"
  }
}

//internet gateway
resource "aws_internet_gateway" "q2-gw" {
  vpc_id = aws_vpc.q2-vpc.id
  tags = {
    "Name" =  "testing"
  }
}

//public sub1
resource "aws_subnet" "public-subnet1" {
    vpc_id = aws_vpc.q2-vpc.id
    cidr_block = "10.0.10.0/24"
    tags = {
      "Name" = "pub_subnet1"
    }
    availability_zone = us-east-2a
    map_public_ip_on_launch = true  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.q2-vpc.id
    tags = {
      "Name" = "public"
    }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.q2-gw.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public.id
}




