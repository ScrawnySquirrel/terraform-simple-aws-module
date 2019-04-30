provider "aws" {
  region = "us-west-2"
}

module "my_vpc" {
  source = "../modules/vpc"

  vpc_cidr = "192.168.0.0/16"
  vpc_id = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source = "../modules/ec2"

  ami_id = "ami-061392db613a6357b"
  subnet_id = "${module.my_vpc.subnet_id}"
}
