terraform {
  backend "s3" {
    bucket  = "fcc-terraform-tfstate"
    key     = "tg-vpc/terraformstatefile"
    region  = "eu-west-1"
    profile = "default"
  }
  required_providers {
    aws = ">=3.0.0"
  }
}
