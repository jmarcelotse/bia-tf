resource "aws_ecs_task_definition" "bia-web" {
  family        = "task-def-bia-web"
  network_mode  = "bridge"
  task_role_arn = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = "bia"
    image     = "${aws_ecr_repository.bia.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 8080,
      hostPort      = 80
    }]
    cpu               = 1024
    memoryReservation = 400
    environment = [
      { name = "DB_HOST", value = "${aws_db_instance.bia.address}" },
      { name = "DB_PORT", value = "5432" },
      { name = "DB_NAME", value = "bia" },
      { name = "DB_USER", value = "postgres" },
      { name = "DB_PASSWORD", value = ".erDZ(9w5p<4J#h2_bc[OQS5)Zv~" },
      { name = "DATABASE_URL", value = "postgresql://postgres:.erDZ(9w5p<4J#h2_bc[OQS5)Zv~@${aws_db_instance.bia.address}:5432/bia" },
      { name = "DB_SECRET_NAME", value = "${data.aws_secretsmanager_secret.bia_db.name}" },
      { name = "DB_REGION", value = "us-east-1" },
      { name = "NODE_ENV", value = "production" },
      { name = "CORS_ORIGIN", value = "*" },
      { name = "PORT", value = "8080" },
      { name = "API_URL", value = "http://184.72.214.214" }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-region"        = "us-east-1",
        "awslogs-group"         = aws_cloudwatch_log_group.ecs_bia_web.name,
        "awslogs-stream-prefix" = "bia"
      }
    }
  }])

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}
