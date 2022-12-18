output "vpc_id" {
  value       = aws_vpc.eks.id
  description = "vpc id"
}

output "vpc_private_subnet_ids" {
  value = [
    for az, subent in aws_subnet.private :
    subent.id
  ]
  description = "vpc private subnets ids"
}
