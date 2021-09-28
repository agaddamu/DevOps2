provider "aws" {
  region = "us-west-2"
}
variable "VPC" {
  type = string
  default = "vpc-9799dfdfccn"
  description = "VPC in which we need to create resources"
}
variable "CIDR" {
  type    = list(string)
  default = ["91.92.93.94/32"]
  description = "CIDR list for allowing traffic from SG"
}

variable "SUBNET" {
  type = string
  default = "subnet-0d-public-e"
  description = "Public subnet for deploying the application"
}

variable "AMI" {
  type = string
  default = "ami-0c2d06d50ce30b442"
  description = "AMI image id for EC2 instance to bake the EC2"
}

variable "EC2_ROLE" {
  type = string
  default = "EC2_DefaultRole"
  description = "Role attached to ec2 Group"
}

variable "EC2_TYPE" {
  type = string
  default = "t2.nano"
}

variable "S3_PATH" {
  type = string
  default = "s3://test-ankur/users/temp"
  description = "Version to be released"
}

variable "RELEASE_VERSION" {
  type = string
  default = "1.0.0"
  description = "S3 Path of an deployed image"
}

resource "aws_security_group" "basic_security" {
  name = "sg_flask"
  description = "Web Security Group for HTTP"
  vpc_id =  var.VPC
  ingress = [
    {
      description = "Allow HTTP Traffic access"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = var.CIDR
      security_groups = []
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      self = true
    }
  ]

  egress = [
    {
      description = "Allow all outbound traffic"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [
        "0.0.0.0/0"]
      ipv6_cidr_blocks = [
        "::/0"]
      security_groups = []
      prefix_list_ids = []
      self = true
    }
  ]

  tags = {
    Name = "rm-application"
  }
}

resource "aws_instance" "app_server_1" {
  ami = var.AMI
  iam_instance_profile = var.EC2_ROLE
  instance_type = var.EC2_TYPE
  subnet_id = var.SUBNET
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.basic_security.id]
  user_data = <<EOF
                  #!/bin/bash
                  echo "Starting user_data"
                  sudo su -
                  sudo yum -y install pip
                  aws s3 cp  "${var.S3_PATH}/${var.RELEASE_VERSION}/" . --recursive
                  mkdir myproject
                  pip install *.whl
                  pip install *.whl -t /root/myproject
                  echo "export FLASK_APP=/root/myproject/my_application/application"  >> /etc/profile
                  source /etc/profile
                  nohup flask run --host=0.0.0.0 --port 80 > log.txt 2>&1 &
                  echo "Application started"
                  echo "End user_data"
                EOF
  tags = {
    Name = "rm-application-cluster-green"
  }
}

