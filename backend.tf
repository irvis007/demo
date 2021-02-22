terraform {
  backend "s3" {
    bucket  = "acg-terraform-state-aws-ter-ans"
    key     = "tg-vpc/terraformstatefile"
    region  = "eu-central-1"
    profile = "default"
  }
}

