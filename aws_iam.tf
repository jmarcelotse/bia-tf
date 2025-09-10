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
}

# Separate IAM role policy resource (replaces deprecated inline_policy)
resource "aws_iam_role_policy" "rds_credentials_manager" {
  name = "rds-credentials-manager"
  role = aws_iam_role.role_acesso_ssm.id

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
# Managed policy attachments (replaces deprecated managed_policy_arns)
resource "aws_iam_role_policy_attachment" "quicksight_secrets_write" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AWSQuickSightSecretsManagerWritePolicy"
}

resource "aws_iam_role_policy_attachment" "administrator_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "ecr_full_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecr_power_user" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_full_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "rds_full_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

# resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
#   role       = aws_iam_role.role_acesso_ssm.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

resource "aws_iam_role_policy_attachment" "quicksight_secrets_write_access" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSQuickSightSecretsManagerWriteAccess"
}

resource "aws_iam_role_policy_attachment" "role_acesso_ssm_policy" {
  role       = aws_iam_role.role_acesso_ssm.name
  policy_arn = aws_iam_policy.get_secret_bia_db.arn
}
