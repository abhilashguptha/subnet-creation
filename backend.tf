terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket"
    key            = "networking/subnets/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true
  }
}
