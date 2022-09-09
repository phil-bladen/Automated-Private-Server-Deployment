resource "aws_internet_gateway" "layer-00-igw" {
  vpc_id = aws_vpc.layer-00-vpc.id
  tags = merge(module.base_context.tags, {
    Name = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-layer-00-igw"
  })
}

resource "aws_eip" "layer-00-eip-for-ngw" { # for ngw
  depends_on = [aws_internet_gateway.layer-00-igw]
  tags = merge(module.base_context.tags, {
    Name = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-layer-00-eip-for-ngw"
  })
}

resource "aws_nat_gateway" "layer-00-ngw" {
  allocation_id = aws_eip.layer-00-eip-for-ngw.id
  subnet_id     = aws_subnet.layer-00-public-subnet[keys(var.vpc-subnets.public_subnets)[0]].id
  # NGW only needs to be on one subnet
  # private subnet instances then connect to the public subnet
  # (and NGW inside it) to make requests to the internet
  tags = merge(module.base_context.tags, {
    Name = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-layer-00-ngw"
  })
  depends_on = [aws_internet_gateway.layer-00-igw] # recommended by terraform documentation
}
