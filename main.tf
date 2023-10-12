provider "aws" {
  region = var.region
}

module "RDS-Module" {
  source            = "./RDS-Module"
  vpc_cidr_block    = var.vpc_cidr_block
  project_name      = var.project_name
  az_count          = var.az_count
  username          = var.username
  password          = var.password
  instance_type     = var.instance_type
  eb_solution_stack = var.eb_solution_stack
}

module "CICD-Module" {
  source                       = "./CICD-Module"
  project_name                 = var.project_name
  region                       = var.region
  s3_location = var.s3_location
        Owner      = var.Owner
        Repo       = var.Repo  
        Branch     = var.Branch  
        OAuthToken = var.OAuthToken
}