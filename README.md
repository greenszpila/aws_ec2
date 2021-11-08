# aws_ec2

- Get the default user name for the AMI that you used to launch your instance:
- For Amazon Linux 2 or the Amazon Linux AMI, the user name is ec2-user.
- For a CentOS AMI, the user name is centos or ec2-user.
- For a Debian AMI, the user name is admin.
- For a Fedora AMI, the user name is fedora or ec2-user.
- For a RHEL AMI, the user name is ec2-user or root.
- For a SUSE AMI, the user name is ec2-user or root.
- For an Ubuntu AMI, the user name is ubuntu.
- For an Oracle AMI, the user name is ec2-user.
- For a Bitnami AMI, the user name is bitnami.

# Ubuntu 18.04 ubuntu@
terraform apply 

# Amzn Linux ec2user@
terraform apply -var-file amzn.tfvars 

# RHEL  ec2user@
terraform apply -var-file rhel.tfvars 

# Debian 10
terraform apply -var-file deb.tfvars

# Suse11
terraform apply -var-file suse11.tfvars