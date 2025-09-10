# resource "aws_subnet" "this" {
#   count             = length(var.subnet_cidrs)
#   vpc_id            = var.vpc_id
#   cidr_block        = var.subnet_cidrs[count.index]
#   availability_zone = var.availability_zones[count.index]

#   tags = merge(
#     var.tags,
#     { Name = "${var.tags["Name"]}-${count.index + 1}" }
#   )
# }


locals {
  region_short = replace(var.aws_region, "/-[a-z]+-[0-9]+$/", "")
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.project}-${var.env}-${local.region_short}-vpc"
    Project     = var.project
    Environment = var.env
    Region      = var.aws_region
    Terraform   = "true"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.public_subnet_name}-${element(var.azs_suffix, count.index)}"
    Project     = var.project
    Environment = var.env
    Type        = "public"
    Terraform   = "true"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.private_subnet_name}-${element(var.azs_suffix, count.index)}"
    Project     = var.project
    Environment = var.env
    Type        = "private"
    Terraform   = "true"
  }
}


