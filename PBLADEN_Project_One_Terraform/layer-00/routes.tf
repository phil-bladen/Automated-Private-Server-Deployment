############### PUBLIC SUBNET ROUTES

resource "aws_route" "to-igw" {
  #All non-local traffic in public subnets is routed to the Internet Gateway
  #for_each               = aws_subnet.layer-00-public-subnet
  route_table_id         = aws_route_table.layer-00-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.layer-00-igw.id
}

resource "aws_route_table" "layer-00-public-rt" { # public subnet route table
  vpc_id = aws_vpc.layer-00-vpc.id
  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-public-subnet-default-route-table"
    Description = "Default route table in ${module.base_context.environment_values.kv.workspace} public subnets for customer ${module.base_context.customer}"
  })
}

resource "aws_route_table_association" "layer-00-public-rt-assoc" { # associate route table with public subnet
  for_each       = aws_subnet.layer-00-public-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.layer-00-public-rt.id
}

############### PRIVATE SUBNET ROUTES

resource "aws_route_table" "layer-00-private-rt" {
  # private subnet route table
  vpc_id = aws_vpc.layer-00-vpc.id

  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-private-subnet-default-route-table"
    Description = "Default route table in ${module.base_context.environment_values.kv.workspace} private subnets for customer ${module.base_context.customer}"
  })

}

resource "aws_route" "to-ngw" {
  # All non-local traffic in private subnets is routed to the NAT Gateway
  route_table_id         = aws_route_table.layer-00-private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.layer-00-ngw.id
}

resource "aws_route_table_association" "layer-00-private-rt-assoc" {
  # associate route table with private subnet
  for_each       = aws_subnet.layer-00-private-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.layer-00-private-rt.id
}
