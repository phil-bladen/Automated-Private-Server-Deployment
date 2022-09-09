terraform {
  backend "s3" {
    region  = "us-gov-west-1"
    profile = "REDACTED"
    bucket  = "REDACTED"
    key     = "REDACTED"
  }
}

module "project" {
  source                            = "../../PBLADEN_Project_One_Terraform"
  user-id                          = var.user-id
  owner                             = var.owner
  aws-account-id                    = var.aws-account-id
  aws-region                        = var.aws-region
  owner-ipv4-address                = var.owner-ipv4-address
  local-absolute-path-to-public-key = var.local-absolute-path-to-public-key
  public-instance-type              = var.public-instance-type
  private-instance-type             = var.private-instance-type
  business                          = var.business
  customer                          = var.customer
  environment                       = var.environment
  product-name                      = var.product-name
  vpc-cidr-block                    = var.vpc-cidr-block
  vpc-subnets                       = var.vpc-subnets
}
