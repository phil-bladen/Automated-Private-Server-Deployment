resource "aws_key_pair" "test-keypair" {
  key_name   = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-default-keypair"
  public_key = file("${var.local-absolute-path-to-public-key}")
  tags = merge(local.base_context.tags, {
    name        = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-default-keypair"
    description = "default ${local.base_context.environment_values.kv.workspace} keypair for customer ${local.base_context.customer}"
  })
}
