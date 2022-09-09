output "vpc-id" {
  value = module.layer-00.vpc.id
}

output "name-of-keypair-used-for-instances" {
  value = module.layer-02.name-of-keypair-used-for-instances
}

output "public-ec2-ip-addresses" {
  value       = module.layer-02.public-ec2-ip-addresses
  description = "PUBLIC IPs of instances in PUBLIC subnets"
}

output "private-ec2-ip-addresses" {
  value       = module.layer-02.private-ec2-ip-addresses
  description = "PRIVATE IPs of instances in PRIVATE subnets"
}

output "private-subnet-ids" {
  value = module.layer-00.private-subnet-ids
}

output "public-subnet-ids" {
  value = module.layer-00.public-subnet-ids
}
