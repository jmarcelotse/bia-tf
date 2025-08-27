# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0dc261beafaf9d4a7"
resource "aws_security_group" "bia_ec2" {
  description = "acesso das ec2 com estrutura da alb"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["54.237.212.177/32", "189.124.209.72/32"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    }, {
    cidr_blocks      = []
    description      = "bia-alb"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_alb.id]
    self             = false
    to_port          = 65535
  }]
  name                   = "bia-ec2"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "bia-ec2"
  }
  tags_all = {
    Name = "bia-ec2"
  }
  vpc_id = local.vpc_id
}

# __generated__ by Terraform from "sg-0c2285777df4fdd67"
resource "aws_security_group" "bia_web" {
  description = "acesso do bia-web"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "liberado para o mundo"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "bia-web"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "bia-web"
  }
  tags_all = {
    Name = "bia-web"
  }
  vpc_id = local.vpc_id
}

# __generated__ by Terraform from "sg-0888f89335d04083c"
resource "aws_security_group" "bia_db" {
  description = "acesso do bia-db"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia-dev.id, aws_security_group.bia_ec2.id]
    self             = false
    to_port          = 5432
    }, {
    cidr_blocks      = []
    description      = "acesso do bia-web"
    from_port        = 5432
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = [aws_security_group.bia_web.id]
    self             = false
    to_port          = 5432
  }]
  name                   = "bia-db"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "bia-db"
  }
  tags_all = {
    Name = "bia-db"
  }
  vpc_id = local.vpc_id
}

# __generated__ by Terraform from "sg-08aa7d1f323c15a04"
resource "aws_security_group" "bia_alb" {
  description = "acesso do bia-alb"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "bia-alb"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "bia-alb"
  }
  tags_all = {
    Name = "bia-alb"
  }
  vpc_id = local.vpc_id
}


resource "aws_security_group" "bia-dev" {
  name        = "bia-dev"
  description = "acesso do bia-dev"
  vpc_id      = local.vpc_id

  ingress {
    description = "liberado para o mundo"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "liberado para o mundo"
    from_port   = 3002
    to_port     = 3002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bia-dev"
    aws  = "ia"
  }
}
