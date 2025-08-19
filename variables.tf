variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zones" {
  description = "Availability zones to use"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "subnet_cidrs" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "tags" {
  description = "Tags to apply to all subnets"
  type        = map(string)
  default = {
    Name    = "subnet"
    Project = "OneCPaaS"
  }
}
