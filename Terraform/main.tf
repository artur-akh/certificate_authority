provider "aws" {
  region = var.region
}

resource "aws_instance" "aws_ca" {
 ami                         = data.aws_ami.latest_aws.id
 instance_type               = var.instance_type
 vpc_security_group_ids      = [aws_security_group.CA_security.id]
 key_name                    = var.key_name
 user_data                   = file("script.sh")
 user_data_replace_on_change = true
 tags = {
   Name = "CA"
 }
}


