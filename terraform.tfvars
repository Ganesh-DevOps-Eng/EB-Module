username          = "admin"
password          = "MyStrongPassword123"
instance_type     = "t3.small"
vpc_cidr_block    = "10.0.0.0/16"
az_count          = "2"
project_name      = "matelliocorp"
eb_solution_stack = "64bit Amazon Linux 2023 v4.0.1 running PHP 8.1"

region                       = "us-east-1"
FullRepositoryId = "Ganesh-DevOps-Eng/php-code"
BranchName     = "main"  
ConnectionArn = "arn:aws:codestar-connections:us-east-1:015058543222:connection/f3944f5f-eca2-49cf-8264-3bda920efcb8"
s3_location = "elasticbeanstalk-us-east-1-015058543222"
ami_id = "ami-053b0d53c279acc90"
root_domain_name = "matelliocorp.com"
#solution_stack_name = "64bit Amazon Linux 2 v4.3.12 running Tomcat 8.5 Corretto 8"
#solution_stack_name = "64bit Amazon Linux 2023 v6.0.1 running Node.js 18"
#solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.11 running PHP 5.6"

# aws elasticbeanstalk list-available-solution-stacks | grep Tomcat
# aws elasticbeanstalk list-available-solution-stacks | Select-String "Tomcat"

###Read this lines ###
#changes two thing sso-login.php "entityId" and "assertionConsumerService uner URL" then update also azure basic configureation
