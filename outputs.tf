output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = aws_subnet.this[*].id
}

output "subnet_cidrs" {
  description = "The CIDR blocks of the created subnets"
  value       = aws_subnet.this[*].cidr_block
}

output "subnet_azs" {
  description = "The Availability Zones of the created subnets"
  value       = aws_subnet.this[*].availability_zone
}

output "subnet_tags" {
  description = "Tags applied to subnets"
  value       = [for s in aws_subnet.this : s.tags]
}
