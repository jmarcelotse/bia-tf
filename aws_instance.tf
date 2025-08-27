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
  user_data            = <<EOF
#!/bin/bash

#Instalar Docker e Git
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user
id ec2-user ssm-user
sudo newgrp docker


#Instalar docker-compose
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

#Ativar docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

#Adicionar swap
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

#Instalar Node.js e npm (versão mais atual via NodeSource)
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
sudo yum install nodejs -y

#Verificar instalação
node --version
npm --version

#Log da instalação para debug
echo "Node.js version: $(node --version)" >> /var/log/user-data.log
echo "npm version: $(npm --version)" >> /var/log/user-data.log

  EOF
}
