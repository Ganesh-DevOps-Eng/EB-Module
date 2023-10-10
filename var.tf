variable "username" {}
variable "password" {}
variable "eb_solution_stack" {}

variable "instance_type" {}
#vpc module variable
variable "vpc_cidr_block" {}
variable "project_name" {}
variable "az_count" {}


#CICD-Module

variable "region" {}
variable "source_stage_provider" {}
variable "source_stage_RepositoryName" {}
variable "GITHUB_Location" {
  default = "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/Vprofile-code-repo"
}
variable "source_stage_BranchName" {}
variable "build_stage_ProjectName" {}
variable "deploy_stage_ApplicationName" {}
variable "deploy_stage_EnvironmentName" {}
variable "github_token" {}
