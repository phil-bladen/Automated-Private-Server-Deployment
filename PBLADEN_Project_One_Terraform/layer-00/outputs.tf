output "public-subnet-ids" {
  value = {
    for k, public-subnet in aws_subnet.layer-00-public-subnet : k => public-subnet.id
  }
}

output "private-subnet-ids" {
  value = {
    for k, private-subnet in aws_subnet.layer-00-private-subnet : k => private-subnet.id
  }
}

output "vpc" {
  value = aws_vpc.layer-00-vpc
}

output "public-subnet-instances-ingress-sg" {
  value = aws_security_group.public-subnet-instances-ingress-sg
}

output "public-subnet-instances-egress-sg" {
  value = aws_security_group.public-subnet-instances-egress-sg
}

output "private-subnet-instances-ingress-sg" {
  value = aws_security_group.private-subnet-instances-ingress-sg
}

output "private-subnet-instances-egress-sg" {
  value = aws_security_group.private-subnet-instances-egress-sg
}

output "base_context" {
  value = module.base_context
}
