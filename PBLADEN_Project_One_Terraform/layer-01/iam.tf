locals {
  base_context = var.layer-00-outputs.base_context
}

resource "aws_iam_policy" "test-permissions-policy" {
  name = "${local.base_context.environment_values.kv.workspace}-${local.base_context.customer}-default-permissions-policy"
  ## The following line allows users to use their own permissions policy for the public instances if they want. If not, an included default policy is used.
  policy = file("${var.local-absolute-path-to-public-instance-iam-permissions-policy-json == "" ? "${path.module}/default-public-instance-permission-policy.json" : var.local-absolute-path-to-public-instance-iam-permissions-policy-json}")
  tags = merge(local.base_context.tags, {
    Name = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-iam-permissions-policy"
  })
}

data "aws_iam_policy_document" "test-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}

module "test-iam-role-module" {
  # in our codebase, we don't appear to use null-context tags for iam roles, so I didn't do that here
  source = "../../../redacted-terraform/modules/aws-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = ["ec2.amazonaws.com"]
        }
      }
    ]
  })
  iam_policy_arn_list       = [aws_iam_policy.test-permissions-policy.arn] # assuming one policy
  iam_role_name             = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-default-iam-role"
  build_user                = var.user-id
  iam_role_description      = "Provides access and permission policies for ${local.base_context.environment_values.kv.workspace} ${local.base_context.customer} public instances"
  iam_instance_profile_name = "${local.base_context.environment_values.kv.workspace}-${local.base_context.customer}-default-iam-instance-profile"
  tag_managedby             = "terraform" # most of codebase uses value "ansible" here, but Terraform is configuring this IAM policy so it is probably managed by Terraform
}