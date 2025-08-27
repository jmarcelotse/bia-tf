# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "role-acesso-ssm"
resource "aws_iam_instance_profile" "role_acesso_ssm" {
  name        = "role-acesso-ssm"
  name_prefix = null
  path        = "/"
  role        = aws_iam_role.role_acesso_ssm.name
  tags        = {}
  tags_all    = {}
}

# __generated__ by Terraform from "role-acesso-ssm"
resource "aws_iam_role" "role_acesso_ssm" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  description           = null
  force_detach_policies = false
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AWSQuickSightSecretsManagerWritePolicy", "arn:aws:iam::aws:policy/AdministratorAccess", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/AmazonECS_FullAccess", "arn:aws:iam::aws:policy/AmazonRDSFullAccess", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", "arn:aws:iam::aws:policy/service-role/AWSQuickSightSecretsManagerWriteAccess"]
  max_session_duration  = 3600
  name                  = "role-acesso-ssm"
  name_prefix           = null
  path                  = "/"
  permissions_boundary  = null
  tags = {
    aws = "formacao"
  }
  tags_all = {
    aws = "formacao"
  }
  inline_policy {
    name = "rds-credentials-manager"
    policy = jsonencode({
      Statement = [{
        Action   = ["secretsmanager:CreateSecret", "secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret", "secretsmanager:ListSecrets", "secretsmanager:UpdateSecret", "secretsmanager:DeleteSecret", "secretsmanager:PutSecretValue", "secretsmanager:TagResource", "secretsmanager:UntagResource"]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "SecretsManagerPermissions"
        }, {
        Action   = ["kms:Decrypt", "kms:DescribeKey", "kms:GenerateDataKey", "kms:GenerateDataKeyWithoutPlaintext", "kms:ReEncryptFrom", "kms:ReEncryptTo", "kms:CreateGrant", "kms:ListKeys", "kms:ListAliases"]
        Effect   = "Allow"
        Resource = ["arn:aws:kms:us-east-1:873976611862:key/*", "arn:aws:kms:us-east-1:873976611862:alias/aws/secretsmanager", "arn:aws:kms:us-east-1:873976611862:alias/aws/rds"]
        Sid      = "KMSPermissions"
        }, {
        Action   = ["rds:ModifyDBInstance", "rds:DescribeDBInstances", "rds:AddTagsToResource", "rds:ListTagsForResource"]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "RDSSecretsManagerIntegration"
      }]
      Version = "2012-10-17"
    })
  }
}
