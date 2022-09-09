variable "user-id" {
  description = "enter your user-id.\n This is used to name resources according to the format '<user-id> - <resourceName>'.\n Also, this is used to tag all AWS resources with the tag 'BuildUser: <your user-id>' "
  type        = string
}

variable "aws-region" {
  description = "what AWS region should this infrastructure be deployed in?"
  type        = string
  default     = "us-gov-west-1"
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

variable "local-absolute-path-to-public-key" {
  description = "This is the local ABSOLUTE path to the public key. \n This public key will be uploaded to all instances created and used for SSH connection."
  type        = string
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

variable "layer-00-outputs" {}
variable "layer-01-outputs" {}
