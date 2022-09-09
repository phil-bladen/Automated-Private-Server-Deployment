variable "user-id" {
  description = "enter your user-id.\n This is used to name resources according to the format '<user-id> - <resourceName>'.\n Also, this is used to tag all AWS resources with the tag 'BuildUser: <your user-id>' "
  type        = string
}

variable "owner" {
  description = "if the employee of the user-id above isn't the 'owner' of these resources, enter an alternate owner here"
  type        = string
  default     = ""
}

### Subnet Variables
variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "vpc-subnets" {
  description = "Map of all VPC Subnets and their CIDR blocks"
  type        = map(map(object({ newbits = number, netnum = number })))
}

variable "aws-account-id" {
  description = "aws account ID of employee using this module"
  type        = string
}

variable "aws-region" {
  description = "what AWS region should this infrastructure be deployed in?"
  type        = string
  default     = "us-gov-west-1"
}

variable "owner-ipv4-address" {
  description = "This is used to allow you to SSH into the public instances from your home IP address"
  type        = string
}

variable "local-absolute-path-to-public-key" {
  description = "This is the local ABSOLUTE path to the public key. \n This public key will be uploaded to all instances created and used for SSH connection."
  type        = string
}

variable "local-absolute-path-to-public-instance-iam-permissions-policy-json" {
  description = "This is the local ABSOLUTE path to the iam permission policy file for the iam roles attached to the public EC2 instances"
  type        = string
  default     = ""
}

variable "public-instance-type" {
  default     = "t3a.small"
  description = "What AWS instance type should the public instance use?"
  type        = string
}

variable "public-ec2-instance-ami-name" {
  description = "Insert the name of the AMI you'd like to use for the public instances. \n A search for this ami will be performed. Regex is suppposed"
  type        = string
  default     = "REDACTED"
}

variable "public-ec2-instance-ami-owner" {
  description = "Who owns the AMI that you'd like to use for the public instances?\n Enter 'self' if this account is listed as an owner"
  type        = string
  default     = "self"
}

variable "private-instance-type" {
  default     = "t3a.small"
  description = "What AWS instance type should the private instance use?"
  type        = string
}

variable "private-ec2-instance-ami-name" {
  description = "Insert the name of the AMI you'd like to use for the private instances. \n A search for this ami will be performed. Regex is suppposed"
  type        = string
  default     = "REDACTED"
}

variable "private-ec2-instance-ami-owner" {
  description = "Who owns the AMI that you'd like to use for the private instances?\n Enter 'self' if this account is listed as an owner"
  type        = string
  default     = "self"
}

variable "business" {
  description = "business"
  type        = string
  default     = "default-business"
}

variable "customer" {
  description = "customer"
  type        = string
  default     = "default-customer"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "default-environment"
}

variable "product-name" {
  description = "product-name"
  type        = string
  default     = "intern project (from var.product-name)"
}
