# Latest AWS ami
data "aws_ami" "latest_aws" {
  most_recent      = true
  owners           = ["137112412989"]
#  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
}
# AWS ami id
output "aws_ami_id" {
    value = data.aws_ami.latest_aws.id
}
# AWS ami name
output "aws_ami_name" {
    value = data.aws_ami.latest_aws.name
}

data "aws_region" "my_region_id" {}
# Region name
output "data_aws_region_name" {
 value = data.aws_region.my_region_id.name
}
# Region description
output "data_aws_region_description" {
 value = data.aws_region.my_region_id.description
}
# public IP_address
output "name" {
  value = aws_instance.aws_ca.public_ip
}
