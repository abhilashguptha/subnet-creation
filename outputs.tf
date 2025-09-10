# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_name" {
  description = "Name tag of the VPC"
  value       = aws_vpc.main.tags["Name"]
}

# Internet Gateway
output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.this.id
}

output "igw_name" {
  description = "Name tag of Internet Gateway"
  value       = aws_internet_gateway.this.tags["Name"]
}

# Public Subnets
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "public_subnet_cidrs" {
  description = "CIDRs of public subnets"
  value       = aws_subnet.public[*].cidr_block
}

output "public_subnet_names" {
  description = "Names of public subnets"
  value       = [for s in aws_subnet.public : s.tags["Name"]]
}

# Private Subnets
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "private_subnet_cidrs" {
  description = "CIDRs of private subnets"
  value       = aws_subnet.private[*].cidr_block
}

output "private_subnet_names" {
  description = "Names of private subnets"
  value       = [for s in aws_subnet.private : s.tags["Name"]]
}

# Route Table
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "public_route_table_name" {
  description = "Name tag of the public route table"
  value       = aws_route_table.public.tags["Name"]
}
