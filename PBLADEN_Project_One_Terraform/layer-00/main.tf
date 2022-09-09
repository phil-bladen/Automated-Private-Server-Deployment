provider "aws" {
  region = var.aws-region
}

resource "aws_vpc" "layer-00-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(module.base_context.tags, {
    Name        = "${module.vpc-context.name}"
    Description = "${module.vpc-context.description}"
  })
}

module "base_context" {
  source = "../../../redacted-terraform/modules/terraform-null-context"

  build_user = var.user-id
  # if owner isn't specified, set owner to var.user-id
  owner       = var.owner == "" ? var.user-id : var.owner
  account_id  = var.aws-account-id
  environment = var.environment

  environment_values = {
    kv = {
      workspace    = terraform.workspace
      product-name = var.product-name
    }
    locals = null
    tags   = null
  }

  business = var.business
  customer = var.customer


  region    = var.aws-region
  partition = "AWS-us-gov"
}

module "vpc-context" {
  source = "../../../redacted-terraform/modules/terraform-null-context"

  context = module.base_context.context

  name        = "${module.base_context.environment_values.kv.workspace}-${module.base_context.resource_prefix}-vpc"
  description = "${module.base_context.environment_values.kv.workspace} VPC for customer ${module.base_context.customer}"
}