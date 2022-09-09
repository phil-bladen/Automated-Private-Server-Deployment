resource "aws_sns_topic" "user_updates" {
  name = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-topic"
  tags = merge(local.base_context.tags, {
    Name        = "${local.base_context.environment_values.kv.workspace}-${local.base_context.resource_prefix}-sns-topic"
    description = "${local.base_context.environment_values.kv.workspace} SNS topic for customer ${local.base_context.customer}"
  })
}
