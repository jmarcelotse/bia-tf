output "instance_id" {
  description = "ID da EC2 criada"
  value       = aws_instance.bia-dev-tf.id
}

output "instance_type" {
  description = "Tipo da EC2 criada"
  value       = aws_instance.bia-dev-tf.instance_type
}

output "aws_security_group_id" {
  description = "ID do security group criado"
  value       = aws_security_group.bia-dev.id
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.bia-dev-tf.public_ip
}

output "private_ip" {
  description = "IP privado da instância EC2"
  value       = aws_instance.bia-dev-tf.private_ip
}

output "rds_endpoint" {
  description = "Endpoint do RDS criado da BIA"
  value       = aws_db_instance.bia.endpoint

}

output "rds_secrets" {
  description = "ARN do secret criado para o RDS"
  # value       = aws_db_instance.bia.master_user_secret.0.arn
  value = tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn

}

output "bia_repository_url" {
  description = "URL do repositório ECR da BIA"
  value       = aws_ecr_repository.bia.repository_url

}

output "rds_secret_name" {
  description = "Nome do meu segredo"
  value       = data.aws_secretsmanager_secret.bia_db.name
}

# Novos outputs adicionados - 09/09/2025
output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.cluster-bia.name
}

output "ecs_cluster_arn" {
  description = "ARN do cluster ECS"
  value       = aws_ecs_cluster.cluster-bia.arn
}

output "ecs_task_definition_arn" {
  description = "ARN da Task Definition ECS"
  value       = aws_ecs_task_definition.bia-web.arn
}

output "ecs_task_role_arn" {
  description = "ARN da Task Role ECS"
  value       = aws_iam_role.ecs_task_role.arn
}

output "cloudwatch_log_group" {
  description = "Nome do Log Group CloudWatch"
  value       = aws_cloudwatch_log_group.ecs_bia_web.name
}
