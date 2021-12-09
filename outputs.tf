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

output "ami_id" {
  #value = "${data.aws_ami.suse-linux-15-sp1.id}"
  value = "ami_id for ${var.ami_name} in ${var.aws_region}: ${data.aws_ami.os[var.ami_name].id}"
}
