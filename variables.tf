//variables.tf
variable "ami_id" {
  // ubuntu 18.04 in us-east-2 8gb all defaults
  //ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20210415
  default = "ami-0b9064170e32bde34"
}

variable "ami_name" {
  default = "krs-ubuntu18"
}
variable "ami_key_pair_name" {
  default = "kriss"
}
variable "security_group_name" {
  default = "allow_ssh_ubuntu18"

}
variable "instance_name" {
  default = "krs-tf-ubuntu18"
}

variable "username" {
  type = string
  default = "ubuntu" 
}