locals {
  base_context = var.layer-00-outputs.base_context
}

module "public-openvpn-ec2-instance" {
  source                       = "../../../redacted-terraform/modules/aws-instance/"
  context                      = local.base_context.context
  for_each                     = var.layer-00-outputs.public-subnet-ids # one for each id
  subnet_id                    = each.value
  iam_instance_profile         = var.layer-01-outputs.public_instance_iam_instance_profile_name
  search_ami_name              = var.public-ec2-instance-ami-name
  search_ami_owner_id          = var.public-ec2-instance-ami-owner
  ec2_key                      = aws_key_pair.test-keypair.key_name
  associate_public_ip_address  = true
  associate_elastic_ip_address = true
  instance_type                = var.public-instance-type
  aws_region                   = var.aws-region
  build_user                   = var.user-id
  security_group_ids           = [var.layer-00-outputs.public-subnet-instances-ingress-sg.id, var.layer-00-outputs.public-subnet-instances-egress-sg.id]
  tag_description              = "public instance ${each.key} for customer ${local.base_context.customer}"
  tag_name                     = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-public-instance-${each.key}"
  tag_productname              = local.base_context.environment_values.kv.product-name
  module_dependency            = join(",", [])
}

module "private-ec2-instance" {
  source                      = "../../../redacted-terraform/modules/aws-instance/"
  context                     = local.base_context.context
  for_each                    = var.layer-00-outputs.private-subnet-ids # one for each id
  subnet_id                   = each.value
  search_ami_name             = var.private-ec2-instance-ami-name
  search_ami_owner_id         = var.private-ec2-instance-ami-owner
  ec2_key                     = aws_key_pair.test-keypair.key_name # name of AWS keypair to use
  associate_public_ip_address = false
  iam_instance_profile        = ""
  instance_type               = var.private-instance-type
  aws_region                  = var.aws-region
  security_group_ids          = [var.layer-00-outputs.private-subnet-instances-ingress-sg.id, var.layer-00-outputs.private-subnet-instances-egress-sg.id]
  tag_description             = "private instance ${each.key} for customer ${local.base_context.customer}"
  tag_name                    = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-private-instance-${each.key}"
  tag_productname             = local.base_context.environment_values.kv.product-name
  module_dependency           = join(",", [])
}
