locals {
  subnet_cidrs = {
    for subnet_type, subnets in var.vpc-subnets : subnet_type => {
      for subnet_num, cidr in subnets : subnet_num => {
        ipv4 = cidrsubnet(var.vpc-cidr-block, cidr.newbits, cidr.netnum)
      }
    }
  }
}

############# PUBLIC SUBNETS

resource "aws_subnet" "layer-00-public-subnet" {
  for_each   = var.vpc-subnets.public_subnets
  vpc_id     = aws_vpc.layer-00-vpc.id
  cidr_block = local.subnet_cidrs.public_subnets[each.key].ipv4
  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-layer-00-public-subnet-${each.key}"
    description = "${module.base_context.environment_values.kv.workspace} public subnet #${each.key} for customer ${module.base_context.customer}"
  })
}

############# PRIVATE SUBNETS

resource "aws_subnet" "layer-00-private-subnet" {
  for_each   = var.vpc-subnets.private_subnets
  vpc_id     = aws_vpc.layer-00-vpc.id
  cidr_block = local.subnet_cidrs.private_subnets[each.key].ipv4
  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-layer-00-private-subnet-${each.key}"
    description = "${module.base_context.environment_values.kv.workspace} private subnet #${each.key} for customer ${module.base_context.customer}"
  })
}
