provider "aws" {
  region = var.aws-region
}

module "layer-00" {
  source             = "./layer-00"
  user-id           = var.user-id
  owner              = var.owner
  aws-account-id     = var.aws-account-id
  aws-region         = var.aws-region
  owner-ipv4-address = var.owner-ipv4-address
  environment        = var.environment
  business           = var.business
  customer           = var.customer
  product-name       = var.product-name
  vpc-cidr-block     = var.vpc-cidr-block
  vpc-subnets        = var.vpc-subnets
}

module "layer-01" {
  source                                                             = "./layer-01"
  local-absolute-path-to-public-instance-iam-permissions-policy-json = var.local-absolute-path-to-public-instance-iam-permissions-policy-json
  user-id                                                           = var.user-id
  aws-region                                                         = var.aws-region
  layer-00-outputs                                                   = module.layer-00
}

module "layer-02" {
  source                            = "./layer-02"
  aws-region                        = var.aws-region
  user-id                          = var.user-id
  public-instance-type              = var.public-instance-type
  public-ec2-instance-ami-name      = var.public-ec2-instance-ami-name
  public-ec2-instance-ami-owner     = var.public-ec2-instance-ami-owner
  private-instance-type             = var.private-instance-type
  private-ec2-instance-ami-name     = var.private-ec2-instance-ami-name
  private-ec2-instance-ami-owner    = var.private-ec2-instance-ami-owner
  local-absolute-path-to-public-key = var.local-absolute-path-to-public-key
  layer-00-outputs                  = module.layer-00
  layer-01-outputs                  = module.layer-01
}
