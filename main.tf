module "RDS-Module" {
  source = "./RDS-Module"
  vpc_cidr_block            = var.vpc_cidr_block
  project_name              = var.project_name
  az_count                  = var.az_count
  username                  = var.username
  password                  = var.password
  instance_type = var.instance_type
}