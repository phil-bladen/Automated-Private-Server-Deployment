resource "aws_security_group" "public-subnet-instances-ingress-sg" {
  description = "default ingress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} public subnets"
  vpc_id      = aws_vpc.layer-00-vpc.id

  ingress = [
    {
      description      = "allow http ingress from all sources"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow https ingress from all sources"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow ssh ingress from my home internet (just for testing)"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${var.owner-ipv4-address}/32"] # owner ip only
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow openVPN ingress from all sources"
      from_port        = 1194
      to_port          = 1194
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-public-subnet-instances-ingress-sg"
    description = "default ingress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} public subnets"
  })
}

resource "aws_security_group" "public-subnet-instances-egress-sg" {
  description = "default egress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} public subnets"
  vpc_id      = aws_vpc.layer-00-vpc.id

  egress = [
    {
      description      = "allow http egress to all sources"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow https egress to all sources"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow ssh egress to other instances in vpc (so public instances can access private ones)"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.layer-00-vpc.cidr_block] # owner ip only
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow openVPN egress to all sources"
      from_port        = 1194
      to_port          = 1194
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-public-subnet-instances-egress-sg"
    description = "default egress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} public subnets"
  })
}

resource "aws_security_group" "private-subnet-instances-ingress-sg" {
  description = "default ingress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} private subnets"
  vpc_id      = aws_vpc.layer-00-vpc.id

  ingress = [
    {
      description      = "allow http ingress from all sources"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow https ingress from all sources"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow all ssh ingress"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow openVPN ingress from all sources"
      from_port        = 1194
      to_port          = 1194
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-private-subnet-instances-ingress-sg"
    description = "default ingress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} private subnets"
  })
}

resource "aws_security_group" "private-subnet-instances-egress-sg" {
  description = "default egress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} private subnets"
  vpc_id      = aws_vpc.layer-00-vpc.id

  egress = [
    {
      description      = "allow http egress to all sources"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow https egress to all sources"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "allow openVPN egress to all sources"
      from_port        = 1194
      to_port          = 1194
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"] # all sources allowed
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  tags = merge(module.base_context.tags, {
    Name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-private-subnet-instances-egress-sg"
    description = "default egress security group for customer ${module.base_context.customer} instances in ${module.base_context.environment_values.kv.workspace} private subnets"
  })
}
