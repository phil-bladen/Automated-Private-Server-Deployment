variable "user-id" {
  description = "enter your user-id.\n This is used to name resources according to the format '<user-id> - <resourceName>'.\n Also, this is used to tag all AWS resources with the tag 'BuildUser: <your user-id>' "
  type        = string
}

variable "aws-region" {
  description = "what AWS region should this infrastructure be deployed in?"
  type        = string
  default     = "us-gov-west-1"
}

variable "local-absolute-path-to-public-instance-iam-permissions-policy-json" {
  description = "This is the local ABSOLUTE path to the iam permission policy file for the iam roles attached to the public EC2 instances"
  type        = string
  default     = ""
}

variable "layer-00-outputs" {}
