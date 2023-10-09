# Elastic Beanstalk Application
resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = "${var.project_name}-eb-app"
  description = "Elastic Beanstalk Application"
}

# Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "eb_env" {
  name        = "${var.project_name}-eb-env"
  application = aws_elastic_beanstalk_application.eb_app.name
  #solution_stack_name = "64bit Amazon Linux 2 v4.3.12 running Tomcat 8.5 Corretto 8"
  #solution_stack_name = "64bit Amazon Linux 2023 v6.0.1 running Node.js 18"
  #solution_stack_name = "64bit Amazon Linux 2023 v4.0.1 running PHP 8.1"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.11 running PHP 5.6"

  # aws elasticbeanstalk list-available-solution-stacks | grep Tomcat
  # aws elasticbeanstalk list-available-solution-stacks | Select-String "Tomcat"




  ########### other config


  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = module.VPC-Module.vpc
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = aws_key_pair.my_key_pair.key_name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "True"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", module.VPC-Module.public_subnet_ids)
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = module.VPC-Module.elastic_beanstalk_sg
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = 2
  }
  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }


  tags = {
    Name = "${var.project_name}_eb_app"
  }

}



