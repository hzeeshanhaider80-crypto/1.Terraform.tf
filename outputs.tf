output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "instance_id" {
  description = "ID of the EC2 server"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP of the server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "Open this in your browser"
  value       = "http://${aws_instance.web.public_ip}"
}

output "ssh_command" {
  description = "Command to connect to the server"
  value       = "ssh -i ~/.ssh/tf-key ubuntu@${aws_instance.web.public_ip}"
}
