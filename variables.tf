//variables.tf

# please modify region and key_pair_name accordingly , 
# optionally instance_size e.g. t2.micro is not available in the eu-north-1 region

variable "aws_region" { default = "us-east-2" } # Ohio
#variable "aws_region" { default = "eu-west-1" } # Dublin

# modify this to match with your .pem key location, this variable is being used in the `ssh connect` output
variable "private_key_location" {
  type = string
  default = "~/coding/kriss.pem"
}

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