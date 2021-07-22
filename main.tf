data "aws_ami" "ubuntu" {

  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

module "vpc_2n2" {
  source        = "./vpc"
  main_vpc_cidr = "10.0.0.0/22"
  publicSubnets = {
    public1 = "10.0.0.0/24",
    public2 = "10.0.1.0/24",
  }
  privateSubnets = {
    private1 = "10.0.2.0/24",
    private2 = "10.0.3.0/24"
  }
}

module "autoscaling_group" {
  source         = "./autoscaling"
  AMI_id         = data.aws_ami.ubuntu.id
  user_data64_file = "install_apache.sh"
  vpc_identifier = [module.vpc_2n2.publicSubnets1_id]
  publicSubnets = module.vpc_2n2.publicSubnets_ids
  main_vpc_id = module.vpc_2n2.main_vpc_id
}