variable "profile" {
  type    = string
  default = "default"
}

################################
### network related variables###
################################

variable "region-master" {
  type    = string
  default = ""
}

variable "vpc-cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "pub-subnet-cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "priv-subnet-cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "contabo-ip" {
  type    = list(string)
  default = [""]
}

#################################
### instance related variables###
#################################
variable "instnce-type" {
  default = "someARMtype"
}

variable "key-name" {
  default = "keyYouHaveGeneratedInAws"
}

locals {
  default-pub-instances-tags = {
    Name              = "fcc-pub-instance"
    Terraform-managed = "yes"
    app               = "locals"
    environment       = "placeholder"
  }

  default-priv-instances-tags = {
    Name              = "fcc-priv-instance"
    Terraform-managed = "yes"
    app               = "locals"
    environment       = "placeholder"
  }
}
