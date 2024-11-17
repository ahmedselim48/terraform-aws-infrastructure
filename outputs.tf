# Output the public IP addresses of the EC2 instances
output "frontend_ip" {
  description = "The public IP of the frontend instance"
  value       = aws_instance.frontend.public_ip
}

output "backend_ip" {
  description = "The public IP of the backend instance"
  value       = aws_instance.backend.public_ip
}

output "database_endpoint" {
  description = "The endpoint of the MySQL database"
  value       = aws_db_instance.mysql.endpoint
}
