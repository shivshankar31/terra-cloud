resource "random_pet" "server" {
  length = 2
}


# module "s3-bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "4.1.2"
# }
#
data "aws_availability_zones" "availability_zone" {}
data "aws_region" "current" {}
data "aws_s3_bucket" "data_bucket" {
  bucket = "my-terra-data-bucket"
}

# resource "aws_iam_policy" "data-bucket-policy" {
#   name = "data-bucket-policy"
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Action" : [
#           "s3:Get*",
#           "s3:List*"
#         ],
#         "Resource" : "${data.aws_s3_bucket.data_bucket.arn}"
#       }
#     ]
#   })
# }

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "first" {
  ami           = "ami-051f8a213df8bc089"
  instance_type = "t2.micro"
  # availability_zone      = "us-east-1"
  key_name               = "Rebuilt-key"
  vpc_security_group_ids = ["sg-0f643afa7ad19dee6", "${aws_security_group.New-default-SG.id}"]
  tags = {
    Name = "Terraform first instance"
    Team = "test"
    Tag  = "referesh only test"
  }
}


resource "aws_security_group" "New-default-SG" {
  name = "new-SG"

  ingress {
    description = "Port 22"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
