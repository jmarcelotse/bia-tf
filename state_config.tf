terraform {
  backend "s3" {
    bucket  = "bia-tf-state-nxt"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "nxt"
  }
}
