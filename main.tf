provider "aws" {
  region     = "ap-southeast-2"
  access_key = "xxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxx"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0c6120f461d6b39e9"
  instance_type          = "t2.micro"
  key_name               = "projecttest"
  monitoring             = true
  vpc_security_group_ids = ["sg-0dd290bf175c8d27f"]
  subnet_id              = "subnet-026c58f1c05a1b7db"
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
