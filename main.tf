provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "random_pet" "security-group" {}


resource "aws_security_group" "allow-ssh-http" {
  name = "${random_pet.security-group.id}-allow"
  #name        = var.security_group_name
  description = "Allow HTTP, HTTPS and SSH traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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
    Name = "terraform"
  }
}


resource "aws_instance" "linux" {
  key_name      = var.ami_key_pair_name
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = [
    aws_security_group.allow-ssh-http.id
  ]


}
//elastic IP
/*
resource "aws_eip" "ubuntu" {
  vpc      = true
  instance = aws_instance.ubuntu.id
}
*/