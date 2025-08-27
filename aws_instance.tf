resource "aws_instance" "bia-dev-tf" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = var.instance_name
  }
  vpc_security_group_ids = [aws_security_group.bia-dev.id]
  root_block_device {
    volume_size = 10
  }

  iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
  user_data            = file("userdata_biadev.sh")
}
