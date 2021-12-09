

# terraform-aws-ec2-instance 

A simple repository that allows you to spin up by default Ubuntu ec2 instance in any region.
Many other Linux distros are available by referring to the matching `tfvars` file.

Please modify the `aws region` and `ami_key_pair_name` in the `variables.tf` file
to match your aws region and aws ssh key.

### Dependencies

* <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli" target="_blank">Terraform</a>
* AWS Account and <a href="https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html" target="_blank">AWS CLI</a>
  

### Installing

Clone repository:  
* `git clone https://github.com/greenszpila/aws_ec2.git`
  
Change directory:  
* `cd aws_ec2`
  
Verify the files have been downloaded:  
* `ls -ltr`
  
Initialize terraform:  
* `terraform init` 

### To spin up simple EC2 Ubuntu 18.04 
`terraform apply` 

# to destroy the instance after testing
`terraform destroy`

### Amzn Linux 
`terraform apply -var-file amzn.tfvars`

# to destroy it 
`terraform destroy -var-file amzn.tfvars`

### RHEL 7
`terraform apply -var-file rhel.tfvars`

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
