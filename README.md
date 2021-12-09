

# terraform-aws-ec2-instance 

Simple repo that you can use to spin up EC2 Instance in US-East-2 location

### Dependencies

* terraform
* aws account and aws cli installed 

### Installing

* git pull repository:  `https://github.com/greenszpila/aws_ec2.git`

### Executing program

### To spin up simple EC2 Ubuntu 18.04 
`terraform apply `

### Amzn Linux 
`terraform apply -var-file amzn.tfvars `

### RHEL 7
`terraform apply -var-file rhel.tfvars `

### CentOS 7
`terraform apply -var-file centos.tfvars`

### Debian 10
`terraform apply -var-file deb.tfvars`

### Suse11
`terraform apply -var-file suse12.tfvars`

### Ubuntu20
`terraform apply -var-file ubuntu20.tfvars`


Get the default user name for the AMI that you used to launch your instance:
For Amazon Linux 2 or the Amazon Linux AMI, the user name is ec2-user.
For a CentOS AMI, the user name is centos or ec2-user.
For a Debian AMI, the user name is admin.
For a Fedora AMI, the user name is fedora or ec2-user.
For a RHEL AMI, the user name is ec2-user or root.
For a SUSE AMI, the user name is ec2-user or root.
For an Ubuntu AMI, the user name is ubuntu.
For an Oracle AMI, the user name is ec2-user.
For a Bitnami AMI, the user name is bitnami.