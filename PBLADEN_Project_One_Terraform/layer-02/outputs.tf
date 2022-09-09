output "name-of-keypair-used-for-instances" {
  value = aws_key_pair.test-keypair.key_name
}

output "public-ec2-ip-addresses" {
  value = {
    for k, instance in module.public-openvpn-ec2-instance : k => instance.public_ip
  }
  description = "PUBLIC IPs of instances in PUBLIC subnets"
}

output "private-ec2-ip-addresses" {
  value = {
    for k, instance in module.private-ec2-instance : k => instance.private_ip
  }
  description = "PRIVATE IPs of instances in PRIVATE subnets"
}
