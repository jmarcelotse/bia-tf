terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "nxt"
}

resource "aws_instance" "bia-dev-tf" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = "bia-dev-tf"
  }
  vpc_security_group_ids = ["sg-0285d77448b0e2f50"]
  root_block_device {
    volume_size = 10
  }
}
