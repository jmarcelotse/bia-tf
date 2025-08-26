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
  value       = aws_security_group.bia-dev-tf-sg.id
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.bia-dev-tf.public_ip
}

output "private_ip" {
  description = "IP privado da instância EC2"
  value       = aws_instance.bia-dev-tf.private_ip
}
