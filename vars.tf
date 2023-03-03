variable "amis" {
  type        = "map"
  default     = {
    "us-east-1" = "ami-026c8acd92718196b"
    "us-east-2" = "ami-0d8f6eb4f641ef691"
  }
}

variable "cidr_blocks"{
  type = "list"
  default = ["187.127.230.180/32", "191.32.154.79/32"]
}

variable "key_name"{
  type = string
  default = "Terraform_aws"
}

variable "instance_type"{
  type = map
  default = {
  "micro" = "t2.micro"
  }
}