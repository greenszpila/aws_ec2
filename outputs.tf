output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.linux.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.linux.public_ip
}

output "username" {
  value = var.username
}

output "connect" {
  value = "ssh -i ${var.ami_key_pair_name}.pem ${var.username}@${aws_instance.linux.public_ip}"
}