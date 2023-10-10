username          = "admin"
password          = "MyStrongPassword123"
instance_type     = "t3.small"
vpc_cidr_block    = "10.0.0.0/16"
az_count          = "2"
project_name      = "matelliocorp"
eb_solution_stack = "64bit Amazon Linux 2023 v4.0.1 running PHP 8.1"

region                       = "us-east-1"
source_stage_provider        = "GITHUB"
source_stage_RepositoryName  = "InventorySystem_PHP"
GITHUB_Location              = "https://github.com/Ganesh-DevOps-Eng/InventorySystem_PHP/blob/main/InventorySystem_PHP.zip"
source_stage_BranchName      = "main"
build_stage_ProjectName      = "matelliocorp-build"
deploy_stage_ApplicationName = "matelliocorp-eb-app"
deploy_stage_EnvironmentName = "matelliocorp--eb-env"
github_token                 = "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"

#solution_stack_name = "64bit Amazon Linux 2 v4.3.12 running Tomcat 8.5 Corretto 8"
#solution_stack_name = "64bit Amazon Linux 2023 v6.0.1 running Node.js 18"
#solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.11 running PHP 5.6"

# aws elasticbeanstalk list-available-solution-stacks | grep Tomcat
# aws elasticbeanstalk list-available-solution-stacks | Select-String "Tomcat"