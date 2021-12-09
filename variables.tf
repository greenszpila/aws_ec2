//variables.tf

// please modify region, key_pair_name accordingly , optionally instance_size

variable "aws_region" { default = "us-east-2" } # Ohio
#variable "aws_region" { default = "eu-west-1" } # Dublin

variable "ami_key_pair_name" { default = "kriss" }
#variable "ami_key_pair_name" { default = "kriss-eu" }

variable "instance_size" { default = "t2.micro"}

variable "ami_name" {
  default = "ubuntu18"
}

variable "instance_name" {
  default = "krs-tf-ubuntu18"
}

variable "username" {
  type = string
  default = "ubuntu" 
}