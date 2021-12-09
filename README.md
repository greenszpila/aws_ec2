

# terraform-aws-ec2-instance 

A simple repository that allows you to spin up by default Ubuntu ec2 instance in any region.
Many other Linux distros are available by referring to the matching `tfvars` file.

Please modify the `aws region` and `ami_key_pair_name` in the `variables.tf` file
to match your aws region and aws ssh key.

### Dependencies

* terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli 
* aws account and aws cli installed: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

### Installing

* git pull repository:  `https://github.com/greenszpila/aws_ec2.git`

### Executing program

### To spin up simple EC2 Ubuntu 18.04 
`terraform apply `
`terraform destroy` to destroy the instance after testing.

### Amzn Linux 
`terraform apply -var-file amzn.tfvars `
`terraform destroy -var-file amzn.tfvars ` to destroy it.

### RHEL 7
`terraform apply -var-file rhel.tfvars `

### CentOS 7
`terraform apply -var-file centos.tfvars`

### Debian 10
`terraform apply -var-file deb.tfvars`

### Suse12 SP5
`terraform apply -var-file suse12.tfvars`

### Suse15 SP1
`terraform apply -var-file suse15.tfvars`

### Ubuntu20
`terraform apply -var-file ubuntu20.tfvars`


The output command will generate the ssh connect command including the default user or the AMI that you used to launch your instance, key name and the IP. For your reference:
For Amazon Linux 2 or the Amazon Linux AMI, the user name is ec2-user.
For a CentOS AMI, the user name is centos or ec2-user.
For a Debian AMI, the user name is admin.
For a Fedora AMI, the user name is fedora or ec2-user.
For a RHEL AMI, the user name is ec2-user or root.
For a SUSE AMI, the user name is ec2-user or root.
For an Ubuntu AMI, the user name is ubuntu.
For an Oracle AMI, the user name is ec2-user.
For a Bitnami AMI, the user name is bitnami.