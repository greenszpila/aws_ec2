provider "aws" {
  profile = "default"
  region  = var.aws_region
}

// security group random name creation and rules

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
    description = "kubernetes_node_port"
    from_port   = 30000
    to_port     = 32767
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

// list of os ami 

locals {
    allowed_os = {
        "amazon": {owner: "amazon",       filter: "amzn2-ami-hvm*"},
        "centos7":   {owner: "aws-marketplace",       filter: "CentOS Linux 7*"},
        "rhel7":   {owner: "309956199498",       filter: "RHEL-7.*"},
        "ubuntu18": {owner: "099720109477", filter: "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"},
        "ubuntu20": {owner: "099720109477", filter: "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"},
        "debian10": {owner: "136693071363", filter: "debian-10*"},
        "suse12": {owner: "013907871322", filter: "suse-sles-12-sp5-v*-hvm-ssd-x86_64"},
        #"suse15": {owner: "013907871322", filter: "suse-sles-15-sp1-v*-hvm-ssd-x86_64"},

    }
}
// Get latest Amzn Linux AMI

data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

// Get latest Ubuntu AMI

data "aws_ami" "ubuntu18" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
// Get latest Cent OS Linux AMI

data "aws_ami" "centos7" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["aws-marketplace"]
}

# Get latest Red Hat Enterprise Linux 7.x AMI
data "aws_ami" "rhel7" {
  most_recent = true
  owners      = ["309956199498"]
  filter {
    name   = "name"
    values = ["RHEL-7.*"]
  }
}

# Get latest Debian Linux 10 AMI
data "aws_ami" "debian10" {
  most_recent = true
  owners      = ["136693071363"]
  filter {
    name   = "name"
    values = ["debian-10*"]
  }
}

# Get latest SUSE Linux Enterprise Server 12 SP5 AMI
data "aws_ami" "suse12" {
  most_recent = true
  owners      = ["013907871322"] # Amazon
  filter {
    name   = "name"
    values = ["suse-sles-12-sp5-v*-hvm-ssd-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
/*
# Get latest SUSE Linux Enterprise Server 15 SP1 AMI
data "aws_ami" "suse15" {
  most_recent = true
  owners      = ["013907871322"] # Amazon
  filter {
    name   = "name"
    values = ["suse-sles-15-sp1-v*-hvm-ssd-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
*/
data "aws_ami" "ubuntu20" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}


// use a for_each in the aws_ami, that will give us an array, 
// we can consume that later in the aws_instance resource

data "aws_ami" "os" {
  for_each = local.allowed_os

  most_recent = true
  owners      = [each.value.owner]
  filter {
    name   = "name"
    values = [each.value.filter]
  }
}

// deploy resource with ami provided byt user or config file 
// this way we can deploy ec2 instance with latest version of choses OS  in any region 
// without refering the exact ami id e.g. "ami-0b9064170e32bde34" is different for ubuntu in eu or us.

resource "aws_instance" "linux" {
  key_name      = var.ami_key_pair_name
  ami           = data.aws_ami.os[var.ami_name].id
  instance_type = var.instance_size 

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
