

## An Elastic IP will be needed for the custom NAT gateway
resource "aws_eip" "k8s_demo_vpc_natgw_eip" {
  vpc = true
  tags = {
    name = "k8s_demo"
  }
}

/*
The NAT Gateway will be created 
It will convert private IPs to public for internet access
The NAT Gateway will be on 'k8s_demo_subnet_1"
*/
resource "aws_nat_gateway" "k8s_demo_vpc_natgw" {
  allocation_id = aws_eip.k8s_demo_vpc_natgw_eip.id
  subnet_id     = aws_subnet.k8s_demo_subnet_public_1.id
  tags = {
    name = "k8s_demo"
  }
}

## A route table will need to be defined to route traffic to NAT gateway
resource "aws_route_table" "k8s_demo_vpc_rt_private" {
  vpc_id = aws_vpc.k8s_demo_vpc.id
  route = [
    { # All values need to be defined, even if not used
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = "${aws_nat_gateway.k8s_demo_vpc_natgw.id}"
      gateway_id                 = ""
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

## The route table has to be associated with the custom VPC
resource "aws_route_table_association" "k8s_demo_vpc_private_1_a" {
  subnet_id      = aws_subnet.k8s_demo_subnet_private_1.id
  route_table_id = aws_route_table.k8s_demo_vpc_rt_private.id
}