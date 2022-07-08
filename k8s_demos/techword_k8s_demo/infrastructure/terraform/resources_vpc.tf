
## A new custom VPC will be created for the "k8s_demo" web server
resource "aws_vpc" "k8s_demo_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "k8s_demo"
  }
}

## This creates a public subnet for use by the "k8s_demo" web server 
resource "aws_subnet" "k8s_demo_subnet_public_1" {
  vpc_id                  = aws_vpc.k8s_demo_vpc.id
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"

  tags = {
    Name = "k8s_demo"
  }
}


## This creates another public subnet for use by the "k8s_demo" web server 
resource "aws_subnet" "k8s_demo_subnet_public_2" {
  vpc_id                  = aws_vpc.k8s_demo_vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "k8s_demo"
  }
}

## This creates a private subnet for use by the "k8s_demo" web server 
resource "aws_subnet" "k8s_demo_subnet_private_1" {
  vpc_id                  = aws_vpc.k8s_demo_vpc.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    name = "k8s_demo"
  }
}

## This creates an Internet Gateway for public internet access
resource "aws_internet_gateway" "k8s_demo_vpc_igw" {
  vpc_id = aws_vpc.k8s_demo_vpc.id
  tags = {
    name = "k8s_demo"
  }

}


/*
A route table representing public_bound traffic will be defined
The route table will route all traffic to the Internet Gateway
Two assoications will also be defined
They will associate both created subnets to the created route table
*/

## This defines the routing table for the custom VPC
resource "aws_route_table" "k8s_demo_vpc_rt_public" {
  vpc_id = aws_vpc.k8s_demo_vpc.id
  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = ""
      gateway_id                 = "${aws_internet_gateway.k8s_demo_vpc_igw.id}"
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    }
  ]
  tags = {
    name = "k8s_demo"
  }
}

# Association of "k8s_demo_subnet_1" with the created VPC route table
resource "aws_route_table_association" "k8s_demo_vpc_public_1_a" {
  subnet_id      = aws_subnet.k8s_demo_subnet_public_1.id
  route_table_id = aws_route_table.k8s_demo_vpc_rt_public.id
}

# Association of "k8s_demo_subnet_2" with the created VPC route table
resource "aws_route_table_association" "k8s_demo_vpc_public_2_a" {
  subnet_id      = aws_subnet.k8s_demo_subnet_public_2.id
  route_table_id = aws_route_table.k8s_demo_vpc_rt_public.id
}

