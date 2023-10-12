resource "aws_codebuild_project" "codebuild" {
  name         = "${var.project_name}-codebuild"
  description  = "CodeBuild project ${var.project_name} "
  service_role = aws_iam_role.codebuild_service_role.arn

  source {
    type            = "S3"
    location        = var.s3_location
    git_clone_depth = 1
    buildspec       = file("./buildspec.yml")
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  artifacts {
    type     = "S3"
    name     = "${var.project_name}-build-artifacts"
    location = "elasticbeanstalk-${var.region}-${data.aws_caller_identity.current.account_id}"

    encryption_disabled = false
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "${var.project_name}-cicd-project"
      stream_name = "buildlog"
    }
  }
  source_version = "refs/heads/vp-rem"
}
