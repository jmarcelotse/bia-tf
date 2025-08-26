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

resource "aws_security_group" "bia-dev-tf-sg" {
  name        = "bia-dev-tf"
  description = "Regra para instancia BIA DEV via terraform"
  vpc_id      = "vpc-03c4e823f9cde5442"

  ingress {
    description = "Liberado 3001 para o mundo"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bia-dev-tf" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }
  vpc_security_group_ids = [aws_security_group.bia-dev-tf-sg.id]
  root_block_device {
    volume_size = 10
  }
}
