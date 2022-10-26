#Calling S3 module

module "s3" {
  source = "./modules/s3"
  bucketname = var.bucketname
  key = var.key
  }

# Create EBS App

resource "aws_elastic_beanstalk_application" "beanstalk_myapp" {
  name = "Signup"
  description = "Signup Node.js application"
}

# Create App Version

resource "aws_elastic_beanstalk_application_version" "beanstalk_myapp_version" {
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  bucket = module.s3.bucket
  key = module.s3.key
  name = "version-myapp-1.0.0"
  depends_on = [module.s3]
}

resource "aws_elastic_beanstalk_environment" "beanstalk_myapp_env" {
  name = "myapp-prod"
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  solution_stack_name = "64bit Amazon Linux 2 v5.6.0 running Node.js 16"
  version_label = aws_elastic_beanstalk_application_version.beanstalk_myapp_version.name
  depends_on = [module.s3]

  setting {
    namespace = "aws:ec2:instances"
    name = "InstanceTypes"
    value = "t2.micro"
  }

  setting {
   namespace = "aws:autoscaling:launchconfiguration"
   name = "IamInstanceProfile"
   value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
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

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = true
    
  }
}

