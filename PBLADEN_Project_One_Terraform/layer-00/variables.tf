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
