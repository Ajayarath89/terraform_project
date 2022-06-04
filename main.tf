provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAWDYIBURFBOKGH73Q"
  secret_key = "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"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0022f774911c1d690"
  instance_type          = "t2.micro"
  key_name               = "terraform"
  monitoring             = true
  vpc_security_group_ids = ["sg-020d448c9c2494131"]
  subnet_id              = "subnet-09944b8728c9c3b55"
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
