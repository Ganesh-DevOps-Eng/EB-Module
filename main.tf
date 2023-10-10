

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
  source_stage_provider        = var.source_stage_provider
  source_stage_RepositoryName  = var.source_stage_RepositoryName
  GITHUB_Location              = var.GITHUB_Location
  source_stage_BranchName      = var.source_stage_BranchName
  build_stage_ProjectName      = var.build_stage_ProjectName
  deploy_stage_ApplicationName = var.deploy_stage_ApplicationName
  deploy_stage_EnvironmentName = var.deploy_stage_EnvironmentName
  github_token                 = var.github_token
}