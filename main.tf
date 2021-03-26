module "first-sg" {
  source = "./module/repository"

  name        = "first-sg"
  description = "First security group"
  vpc_id      = "vpc-055d676e"

  sg_rules_cidr = [
    ["allow_https", "ingress", "0.0.0.0/0", "443", "443", "tcp", "Allow access from anywhere to HTTPS"],
    ["allow_ssh_vpc", "ingress", "172.16.0.0/16", "22", "22", "tcp", "Allow access from all the VPC CIDRs to the SSH port"],
    ["allow_google_dns", "egress", "8.8.8.8/32,8.8.4.4/32", "56", "56", "udp", "Allow access to DNS on destinations 8.8.4.4/32 and 8.8.8.8/32"]
  ]
  sg_rules_id = []
}

module "second-sg" {
  source = "./module/repository"

  name        = "second-sg"
  description = "Second security group"
  vpc_id      = "vpc-055d676e"

  sg_rules_cidr = []
  sg_rules_id = [
    ["allow_first_sg", "ingress", module.first-sg.sg-id, "8080", "8080", "tcp", "Allow access from security group (a.) to port tcp/8080"],
  ]
}